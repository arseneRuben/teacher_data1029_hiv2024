DROP USER 'alpha'@'localhost';
DROP USER 'pharmacist'@'localhost';
DROP DATABASE IF EXISTS epharmacy;
DROP DATABASE IF EXISTS library;
DROP user 'pma'@'localhost';


RENAME USER 'alpha'@'localhost' TO 'librarian'@'localhost';
UPDATE mysql.user
SET Password = PASSWORD('PasswordPharmacist') WHERE User = 'pharmacist' AND Host = 'localhost';
ALTER USER 'librarian'@'localhost' IDENTIFIED BY 'PasswordLibrarian';

FLUSH PRIVILEGES;
-- 2-  Creation des utilisateur
CREATE USER pharmacist@localhost IDENTIFIED BY 'PasswordPharmacist', librarian@localhost IDENTIFIED BY 'PasswordLibrarian' ;
-- 3-  Comparer les privilleges des utilisateurs root, librarian  et pharmacist sur toutes les bases de donnees ?
SELECT Host, User, Select_priv, Insert_priv, Update_priv, Delete_priv ,Create_priv, Drop_priv,Index_priv, Alter_priv
FROM mysql.user;
-- 4-   Niveau Base de donnees : Alpha (en accès local) peut créer ou supprimer des tables dans la base epharmacy
GRANT SELECT_PRIV, CREATE_PRIV, UPDATE_PRIV, DELETE_PRIV ON epharmacy.*
TO 'pharmacist'@'localhost';

GRANT SELECT, INSERT, UPDATE, DELETE ON library.*
TO 'librarian'@'localhost';
GRANT CREATE, DROP, ALTER ON library.*
TO 'librarian'@'localhost';

-- 5-  Comparer les privilleges des utilisateurs root, librarian  et pharmacist sur toutes les bases de donnees ?
SELECT Host, User, Select_priv, Insert_priv, Update_priv, Delete_priv ,Create_priv, Drop_priv,Index_priv, Alter_priv
FROM mysql.user;

REVOKE CREATE, DROP ON epharmacy.*  FROM 'alpha'@'localhost';

-- Beta peut créer des bases de données.
GRANT CREATE ON *.* TO 'beta'@'localhost';
REVOKE CREATE ON *.* FROM 'beta'@'localhost';

--  Niveau Table : Alpha peut insérer, extraire, supprimer et modifier la colonne NAME de la table product contenue dans la base epharmacy
GRANT INSERT, SELECT, DELETE, UPDATE(name)
ON  epharmacy.product 
TO 'pharmacist'@'localhost';
-- Alpha peut modifier la structure ou les contraintes de la table Product contenue dans la base epharmacy.
GRANT DROP, CREATE ON epharmacy.*
TO 'pharmacist'@'localhost';
-- Beta peut extraire seulement la colonne title de la table titles contenue dans la base library. 
GRANT SELECT(title) 
ON library.titles
TO 'beta'@'localhost'
WITH GRANT OPTION;

SHOW GRANTS FOR 'root'@'localhost';
SHOW GRANTS FOR 'alpha'@'localhost';
SHOW GRANTS FOR 'beta'@'localhost';

SELECT Host,User, Create_priv,Drop_priv,Index_priv,Alter_priv FROM mysql.user;

SELECT Host, User, Db, Create_priv, Drop_priv, Alter_priv FROM mysql.db;

DROP USER 'alpha'@'localhost';
DROP USER 'beta'@'localhost';

GRANT ALL ON epharmacy.*
TO 'alpha'@'localhost';

GRANT ALL ON library.*
TO 'beta'@'localhost';

SHOW GRANTS FOR 'librarian'@'localhost';

SELECT CONCAT(User,'@',Host) "Compte",
CONCAT(Db,'.',Table_name) "Objet", Grantor, Table_priv
FROM mysql.tables_priv;
SELECT Host, User, Db, Create_priv, Drop_priv, Alter_priv FROM mysql.db;

SELECT CONCAT(User,'@',Host) "Compte", CONCAT(Db,'.',Table_name) "Objet",
Column_name, Column_priv FROM mysql.columns_priv;

GRANT INSERT  ON library.titles TO 'librarian'@'localhost';
SHOW DATABASES;
GRANT CREATE ROUTINE, EXECUTE
ON library.*
TO 'librarian'@'localhost';
