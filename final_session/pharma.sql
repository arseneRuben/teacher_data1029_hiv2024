/*4. Les nom complets utilisateurs de la e-pharmacie et la duree moyenne de chacun une fois connecte dans l'applications?*/
use epharmacy;
SELECT 
    CONCAT(u.firstname, ' ', u.lastname) AS full_name,
    AVG(TIMESTAMPDIFF(SECOND, ch.login_date, ch.logout_date))/60 AS average_session_duration_minutes
FROM 
    connection_history ch
JOIN 
    users u ON ch.user_id = u.id
GROUP BY 
    u.id;

/*5 Le role de l'utilisateur qui a passer le plus de temps etant connecte dans l'applications?*/
SELECT 
    roles.name AS role_name,
    SUM(TIMESTAMPDIFF(SECOND, connection_history.login_date, connection_history.logout_date)) AS total_time_seconds
FROM 
    users
JOIN 
    connection_history ON users.id = connection_history.user_id
JOIN 
    roles ON users.role_id = roles.id
GROUP BY 
    users.id
ORDER BY 
    total_time_seconds DESC
LIMIT 1;


/*6. Les fournisseurs des 3 produits les plus commercialises?*/

SELECT 
    suppliers.name AS supplier_name,
    SUM(cart_product.quantity) AS total_quantity_sold,
    products.name AS product_name
FROM 
    cart_product
JOIN 
    products ON cart_product.product_id = products.id
JOIN 
    suppliers ON products.supplier_id = suppliers.id
GROUP BY 
    cart_product.product_id
ORDER BY 
    total_quantity_sold DESC
LIMIT 3;

/*7. Les chiffre d'affaire pas entrepo*/
select w.name as warehouses_name,
SUM(cp.quantity * p.price) as total_revenu
from cart_product cp
join products p on cp.product_id = p.id
join warehouses w on p.warehouse_id = w.id
group by w.id;

-- ou encore 

SELECT 
    w.name AS warehouse_name,
    IFNULL(SUM(o.total_amount), 0) AS revenue
FROM 
    warehouses w
LEFT JOIN 
    products p ON w.id = p.warehouse_id
LEFT JOIN 
    cart_product cp ON p.id = cp.product_id
LEFT JOIN 
    carts c ON cp.cart_id = c.id
LEFT JOIN 
    orders o ON c.id = o.cart_id
GROUP BY 
    w.id;
    
/*8. modifier la table products de sorte a affecer l'image "medoc.kpg" comme image par defaut aux produits medixaux.*/
update products
set image = 'medoc.jpg'
where id>0;

/*9. Ajouter une colonne gender specifiant le sexe des utilisateur de l'applications. Cette colonne doit etre un enumeration contenant pour valeur male,female et other.
alter table users
add column gender enum('male','female','other') not null default 'other'; */

/*10.ecire une procedure stockee spprofileimage permettant d'affecter une image de profile par defaut aux utilisateur*/

delimiter $$
use epharmacy;
-- Supprimer la procédure stockée existante si elle existe
DROP PROCEDURE IF EXISTS spProfileImage;

-- Créer la nouvelle procédure stockée
create procedure spProfileImage()
begin
-- a. ajout de la colonne profile_image si elle n existe pas deja
	alter table users 
    add column profile_image  VARCHAR(4) DEFAULT 'other.jg' if not exists;
-- b. Les utilisateurs MALE auront pour image male.jpg
  update users
  set profile_image = 'male.jpg'
  where gender = 'MALE' and profile_image is null;

-- c. Les utilisateurs FEMALE auront pour image female.jpg
  update users
  set profile_image = 'female.jpg'
  where gender = 'FEMALE' and profile_image is null;

-- d. Les autres utilisateurs auront pour image other.jpg
  update users
  set profile_image = 'other.jpg'
  where gender not in ('MALE', 'FEMALE') and profile_image is null;
end$$

delimiter ;

-- Appeler la nouvelle procédure stockée
CALL spprofileimage();

update users set gender = "male" where id>3;

select image, gender from users;
/*11. ajouter une contraite a la table users afin de garantir l'unicite des adresses electroniques(email) des utilisateurs de l'application*/
alter table users
add constraint unique_email unique(email);
-- ou encore
ALTER TABLE users
ADD UNIQUE (email);

-- 12 Effectuez sous forme de transactions toutes les insertions nécessaires pour passer les ventes représentées par la capture suivante :
-- Début de la transaction globale
START TRANSACTION;
-- Insertions des produits inexistants
insert into products(id, name, description, code_product, supplier_id, warehouse_id, image, min_quantity, price) values
(6, 'Gravol', 'produit anti-douleur', 'T12344', 1, 1, NULL, 1, 5.50), 
(7, 'Ibuprofen','produit anti-douleur','', 1, 1, NULL, 1, 11), 
(8, 'Multi-Vitamine', 'produit inutile', '', 1, 1, NULL, 1, 25),
(9, 'Ducolax', 'produit de marde', '', 1, 1, NULL, 1, 10);
-- a. Insérer un nouvel utilisateur au nom de Alain Foka avec un mot de passe correspondant à la chaine vide.

INSERT INTO users (firstname, lastname, password, role_id, email, country, actif, image)
VALUES ('Alain', 'Foka', '', 3, '', '', 1, '');

-- Obtention de l'ID pour Alain Foka
SET @user_id_alain = LAST_INSERT_ID();


-- Trouver l'ID d'Abdoulaye Mohamed qui est l'administrateur .

SET @admin_id = 2;

-- Traitement de la commande pour FATI AMADOUà

SET @user_id_fati = (SELECT id FROM users WHERE firstname = 'Fati' AND lastname = 'Amadou');
INSERT INTO carts (user_id, actif) VALUES (@user_id_fati, 1);
SET @cart_id_fati = LAST_INSERT_ID();

-- Insérez les produits pour FATI AMADOU
INSERT INTO cart_product (cart_id, product_id, quantity, total, tax) VALUES 
(@cart_id_fati, (SELECT id FROM products WHERE name = 'Advile'), 4, 4 * (SELECT price FROM products WHERE name = 'Advile'), 0.10 * (4 * (SELECT price FROM products WHERE name = 'Advile'))),
(@cart_id_fati, (SELECT id FROM products WHERE name = 'Paracetamol2'), 5, 5 * (SELECT price FROM products WHERE name = 'Paracetamol2'), 0.10 * (5 * (SELECT price FROM products WHERE name = 'Paracetamol2'))),
(@cart_id_fati, (SELECT id FROM products WHERE name = 'Gravol'), 7, 7 * (SELECT price FROM products WHERE name = 'Gravol'), 0.10 * (7 * (SELECT price FROM products WHERE name = 'Gravol')));

-- Calculez le total pour la commande de FATI AMADOU et insérer la commande
SET @total_fati = (SELECT SUM(total) FROM cart_product WHERE cart_id = @cart_id_fati);
INSERT INTO orders (customer_id, order_date, total_amount, status, user_id, cart_id) 
VALUES (@user_id_fati, NOW(), @total_fati, 0, @admin_id, @cart_id_fati);



-- Traitement de la commande pour ALAIN FOKA
INSERT INTO carts (user_id, actif) VALUES (@user_id_alain, 1);
SET @cart_id_alain = LAST_INSERT_ID();

INSERT INTO cart_product (cart_id, product_id, quantity, total, tax) VALUES
(@cart_id_alain, (SELECT id FROM products WHERE name = 'Ibuprofen'), 5, 5 * (SELECT price FROM products WHERE name = 'Ibuprofen'), 0.10 * (5 * (SELECT price FROM products WHERE name = 'Ibuprofen'))),
(@cart_id_alain, (SELECT id FROM products WHERE name = 'Ducolax'), 3, 3 * (SELECT price FROM products WHERE name = 'Ducolax'), 0.10 * (3 * (SELECT price FROM products WHERE name = 'Ducolax'))),
(@cart_id_alain, (SELECT id FROM products WHERE name = 'Tilenol'), 4, 4 * (SELECT price FROM products WHERE name = 'Tilenol'), 0.10 * (4 * (SELECT price FROM products WHERE name = 'Tilenol'))),
(@cart_id_alain, (SELECT id FROM products WHERE name = 'Gravol'), 7, 7 * (SELECT price FROM products WHERE name = 'Gravol'), 0.10 * (7 * (SELECT price FROM products WHERE name = 'Gravol')));

-- Calcul du total pour la commande d'Alain Foka et insertion de la commande

SET @total_alain = (SELECT SUM(total) FROM cart_product WHERE cart_id = @cart_id_alain);
SET @tax_alain = @total_alain * 0.10;
INSERT INTO orders (customer_id, order_date, total_amount, status, user_id, cart_id) 
VALUES (@user_id_alain, NOW(), @total_alain + @tax_alain, 0, @admin_id, @cart_id_alain);


-- Insérer un nouveau panier pour la deuxième commande de Fati Amadou

INSERT INTO carts (user_id, actif) VALUES (@user_id_fati, 1);
SET @cart_id_fati_2 = LAST_INSERT_ID();

-- Insérez les détails de la deuxième commande pour FATI AMADOU

INSERT INTO cart_product (cart_id, product_id, quantity, total, tax) VALUES 
(@cart_id_fati_2, (SELECT id FROM products WHERE name = 'Multi-Vitamine'), 1, 1 * (SELECT price FROM products WHERE name = 'Multi-Vitamine'), 0.10 * (1 * (SELECT price FROM products WHERE name = 'Multi-Vitamine'))),
(@cart_id_fati_2, (SELECT id FROM products WHERE name = 'Bon Koga'), 2, 2 * (SELECT price FROM products WHERE name = 'Bon Koga'), 0.10 * (2 * (SELECT price FROM products WHERE name = 'Bon Koga'))),
(@cart_id_fati_2, (SELECT id FROM products WHERE name = 'Gravol'), 10, 10 * (SELECT price FROM products WHERE name = 'Gravol'), 0.10 * (10 * (SELECT price FROM products WHERE name = 'Gravol')));


-- Calculer le total pour la deuxième commande de FATI AMADOU

SET @total_fati_2 = (SELECT SUM(total) FROM cart_product WHERE cart_id = @cart_id_fati_2);
SET @tax_fati_2 = @total_fati_2 * 0.10;

-- Insérer la deuxième commande pour FATI AMADOU dans la table orders

INSERT INTO orders (customer_id, order_date, total_amount, status, user_id, cart_id) 
VALUES (@user_id_fati, NOW(), @total_fati_2 + @tax_fati_2, 0, @admin_id, @cart_id_fati_2);


COMMIT;



/*13.modification de donnees:*/


/*Modifier l'utilisateur Ali Sani*/
UPDATE users 
SET 
  designation = 'Comptable',
  adress = '415 Av. de l’Université',
  province = 'NB',
  postal_code = 'E1A 3E9',
  phone = '4065954526',
  email = 'Ali@ccnb.ca'
WHERE id = 3;

-- Modification de données:

-- Modification des données pour Oumar Moussa
UPDATE users 
SET 
  designation = 'RH',
  adress = '1750 Rue Crevier',
  province = 'QC',
  postal_code = 'H4L2X5',
  phone = '5665954526',
  email = 'Oumar@gmail.com'
WHERE id = 6; 

-- Modification des données pour Dupon Poupi
UPDATE users 
SET 
  designation = 'Consultant',
  adress = '674 Van horne',
  province = 'NS',
  postal_code = 'B4V 4V5',
  phone = '7854665265',
  email = 'Foka@ccnb.ca'
WHERE id = 5;

