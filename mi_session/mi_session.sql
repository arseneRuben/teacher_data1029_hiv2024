
-- exercice 1 : Liste des utilisateurs selon le rôle 



SELECT u.full_name as Nom_complet, r.name AS Role
FROM `user` u
JOIN `role` r ON u.role_id = r.id
order BY r.name;


-- exercice 2 : Noms et quantité des produits achetés par Oumar Moussa 

SELECT p.name AS Designation, ol.quantity AS Quantité
FROM `user` u
JOIN `invoice` i ON u.id = i.customer_id
JOIN `orders` o ON i.order_id = o.id
JOIN `orderline` ol ON o.id = ol.order_id
JOIN `product` p ON ol.product_id = p.id
WHERE u.full_name = 'Oumar Moussa';


-- question 3 : Quel son les noms de produits dont le fournisseur est basé a Moncton 

SELECT p.name AS nom_produit , s.city as ville
FROM `product` p
JOIN `supplier` s ON p.supplier_id = s.id
WHERE s.city = 'Moncton';

-- question 4 : qui a passé le plus de temps une fois connecté dans l’application 


SELECT u.full_name AS Nom_complet, SUM(ch.onsite_time) AS total_time
FROM user u
JOIN connection_history ch ON u.id = ch.user_id
GROUP BY u.id
ORDER BY total_time DESC  
LIMIT 1 -- pour limiter l'affichage a la premiere ligne 
;

Select  u.full_name 
FROM user u
JOIN connection_history ch ON u.id = ch.user_id
WHERE ch.onsite_time=(
 Select max(ch.onsite_time)
 FROM  connection_history ch );

-- question 5 : quel est le dernier utilisateur a se déconnecter 

SELECT user_id , u.full_name
FROM connection_history ch join `user` u  ON u.id = ch.user_id
WHERE logout_date IS NOT NULL 
ORDER BY logout_date DESC    -- pour affichier les resultats d'une maniere decroissante 
LIMIT 1; -- pour limiter le resultat a la premiere ligne 
