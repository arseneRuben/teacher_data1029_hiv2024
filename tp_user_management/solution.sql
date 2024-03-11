
-- 2 Creer les utilisateurs
CREATE USER IF NOT EXISTS "librarian"@"localhost" IDENTIFIED BY "PasswordLibrarian";
CREATE USER IF NOT EXISTS "pharmacist"@"localhost" IDENTIFIED BY "PasswordPharmacist";
-- 3 On ne leur a pas accorde les droits necessaires, mais root a ces droits par defaut
-- 5 Non

-- 6
GRANT SELECT, UPDATE, DELETE, INSERT ON epharmacy.role 	TO "pharmacist"@"localhost";
GRANT SELECT, UPDATE, DELETE, INSERT ON epharmacy.user 	TO "pharmacist"@"localhost";
GRANT SELECT, UPDATE, DELETE, INSERT ON epharmacy.supplier 	TO "pharmacist"@"localhost";
GRANT SELECT, UPDATE, DELETE, INSERT ON epharmacy.connection_history 	TO "pharmacist"@"localhost";