-- Devoir 3 SQL :

-- 1. La liste des paires (auteur, éditeur) demeurant dans la même ville : (10ps)

SELECT a.au_id AS "Identifiant Auteur", CONCAT(a.au_lname," ", a.au_fname) AS "Nom et Prenom Auteur",
       a.city As "Ville Auteur", p.pub_name AS "Nom Editeur",  p.city AS "Ville Editeur"
FROM authors AS a
JOIN publishers AS p ON a.city = p.city
GROUP BY a.city, p.city;

-- 2. La liste des paires (auteur, éditeur) demeurant dans la même ville, incluant 
-- aussi les auteurs qui ne répondent pas à ce critère. (10ps)

SELECT a.au_id AS "Identifiant Auteur", CONCAT(a.au_lname," ", a.au_fname) AS "Nom et Prenom Auteur",
       a.city As "Ville Auteur", p.pub_name AS "Nom Editeur",  p.city AS "Ville Editeur"
FROM authors AS a
LEFT JOIN publishers AS p ON a.city = p.city;

-- 3. La liste des paires (auteur, éditeur) demeurant dans la même ville, incluant 
-- aussi les éditeurs qui ne répondent pas à ce critère : (10ps)

SELECT a.au_id AS "Identifiant Auteur", CONCAT(a.au_lname," ", a.au_fname) AS "Nom et Prenom Auteur",
       a.city As "Ville Auteur", p.pub_name AS "Nom Editeur",  p.city AS "Ville Editeur"
FROM authors AS a
RIGHT JOIN publishers AS p ON a.city = p.city;

-- 4. La liste des paires (auteur, éditeur) demeurant dans la même ville, incluant les 
-- auteurs et les éditeurs qui ne répondent pas à ce critère.

SELECT a.au_id AS "Identifiant Auteur", CONCAT(a.au_lname," ", a.au_fname) AS "Nom et Prenom Auteur",
       a.city As "Ville Auteur", p.pub_name AS "Nom Editeur",  p.city AS "Ville Editeur"
FROM authors AS a
LEFT JOIN publishers AS p ON a.city = p.city
UNION
SELECT a.au_id AS "Identifiant Auteur", CONCAT(a.au_lname," ", a.au_fname) AS "Nom et Prenom Auteur",
       a.city As "Ville Auteur", p.pub_name AS "Nom Editeur",  p.city AS "Ville Editeur"
FROM authors AS a
RIGHT JOIN publishers AS p ON a.city = p.city;

-- 5. Effectif des employes par niveau d'experience :

SELECT emp_id AS "Identifiant Employee", hire_date AS "Date d'Embauche", 
	   COUNT(*) 
FROM employees
GROUP BY hire_date 
ORDER BY hire_date;

-- 6. Liste des employes par maison d'edition :

SELECT e.emp_id "Identifiant Employee", CONCAT(e.fname," ", e.lname) AS "Nom et Prenom d'Employee", 
       p.pub_name AS "Nom Editeur"
FROM employees AS e
JOIN publishers AS p ON e.pub_id = p.pub_id
GROUP BY CONCAT(e.fname," ", e.lname);

-- 7. Salaires horaires moyens des employes par maison d'edition :

SELECT p.pub_name AS "Maison d'Edition",
       AVG(e.salary) AS "Salaire Moyen"
FROM employees AS e
JOIN publishers AS p ON e.pub_id = p.pub_id
GROUP BY p.pub_id;

-- 8- Effectif des employee de niveau SEINIOR par maison d'edition :

SELECT p.pub_id, p.pub_name, e.job_lvl AS "Niveau d'Emploi",
       COUNT(e.job_lvl) AS "Nombre Employee"
FROM employees AS e
JOIN publishers AS p ON e.pub_id = p.pub_id
WHERE e.job_lvl = "SEINIOR"
GROUP BY e.pub_id;






