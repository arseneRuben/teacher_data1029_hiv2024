-- 1- Quels editeurs emploient des employes de niveau JUNIOR ou INTERMEDIAIRE
-- publishers, employees(job_lvl), 
-- --  les employes de niveau  JUNIOR ou INTERMEDIAIRE
use library;
SELECT distinct pub_id
FROM employees 
WHERE job_lvl = 'JUNIOR' OR  job_lvl = 'INTERMEDIAIRE';


SELECT * 
FROM publishers p
WHERE p.pub_id IN (SELECT  pub_id
FROM employees 
WHERE job_lvl IN ( 'JUNIOR' ,'INTERMEDIAIRE'));

-- 2- Quels sont les editeurs employant au moins deux employes de niveau JUNIOR
-- -- cherchons d'abord les employes de niveau JUNIOR
SELECT emp_id 
FROM employees 
WHERE job_lvl = 'JUNIOR';
-- regoupons les employes selon les employeurs (publishers)
SELECT pub_id, COUNT(emp_id) 
FROM employees 
WHERE job_lvl = 'JUNIOR'
GROUP BY(pub_id);
-- Cherchons ceux de ces employeurs ayant au moins deux JUNIORS
SELECT pub_id, COUNT(emp_id) as nb_junior
FROM employees 
WHERE job_lvl = 'JUNIOR'
GROUP BY(pub_id)
HAVING nb_junior >=2 ;
-- Donnons les noms des empoyeurs concernes
SELECT pub_name 
FROM publishers p
WHERE p.pub_id IN (SELECT pub_id
FROM employees 
WHERE job_lvl = 'JUNIOR'
GROUP BY(pub_id)
HAVING COUNT(emp_id)  >=2 );

-- 3- Liste des auteurs ayant plus de 2 publications
  -- liste des publication par auteur
  SELECT * 
  FROM authors
  WHERE au_id IN
  (SELECT au_id 
  FROM titleauthor
  group by au_id
  HAVING count(title_id)>1); 
-- 4-Liste des auteurs n'ayant publie que dans la maison d'edition Harmattan, et donnez leur nombre de livres publies
-- -- id de la maison d'edition Harmattan
SELECT pub_id 
FROM publishers
WHERE pub_name='Harmattan';
-- --  Liste des livres publies chez les editions Harmattan
SELECT t.title_id
FROM titles t JOIN publishers p ON t.pub_id = p.pub_id
WHERE pub_name='Harmattan';
-- -- Recherche des auteurs des livres publies chez harmattan
SELECT au_id , count(title_id)
FROM titleauthor
WHERE title_id IN (
SELECT t.title_id
FROM titles t JOIN publishers p ON t.pub_id = p.pub_id
WHERE pub_name='Harmattan')
GROUP BY au_id ;

-- -- Retenons ce ces auteurs , que ceux qui ont publie uniquement chez Harmattan
SELECT tl.pub_id , ta.au_id
FROM titleauthor ta JOIN titles tl ON ta.title_id = tl.title_id
WHERE au_id IN(
SELECT au_id 
FROM titleauthor
WHERE title_id IN (
SELECT t.title_id
FROM titles t JOIN publishers p ON t.pub_id = p.pub_id
WHERE pub_name='Harmattan')
GROUP BY au_id)
GROUP BY ta.au_id
HAVING tl.pub_id IN (SELECT pub_id from publishers WHERE pub_name='Harmattan') ;


-- 5- Liste des auteurs n'ayant publie que dans une seule maison d'edition

-- 6- Liste des auteurs n'ayant publie dans plus d'une maison d'edition

-- 7- Liste des auteurs n'ayant publie dans les maisons d'edition canadiennes

