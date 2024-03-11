
use epharmacy;
  -- Quelle est temps moyen passe un utilisateur donnee ?
delimiter $											
SET @vs_username = 'Fati Bobodiouf' $        
DROP PROCEDURE IF EXISTS avgConnectedTime$
CREATE PROCEDURE avgConnectedTime()
BEGIN
	DECLARE avg_time time ;
	SELECT AVG(onsite_time) INTO avg_time FROM user u JOIN connection_history h ON u.id = h.user_id
    GROUP BY  u.full_name
	HAVING u.full_name = @vs_username ;
    SELECT avg_time;
END;
DROP PROCEDURE IF EXISTS getEmail$
CREATE PROCEDURE getEmail()
BEGIN
	SELECT email 
	FROM user WHERE full_name = @vs_username;
END;

DROP PROCEDURE IF EXISTS getProductByCustomer$
CREATE PROCEDURE getProductByCustomer(IN customer VARCHAR(100))
BEGIN
	SELECT name AS 'Designation'  , SUM(quantity) AS 'Quantites' , invoice.id AS "Facture"
	FROM product JOIN orderline ON product.id = orderline.product_id JOIN orders ON orders.id = orderline.order_id JOIN invoice ON invoice.order_id = orders.id JOIN user ON  invoice.customer_id = user.id && user.full_name = customer
	GROUP BY product.id;
END
$
-- CALL avgConnectedTime();$
-- CALL  getEmail();$
CALL getProductByCustomer("Oumar Moussa");$
										


