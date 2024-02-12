-- 1- Quels editeurs emploient des employes de niveau JUNIOR ou INTERMEDIAIRE
-- publishers, employees(job_lvl), 
-- --  les employes de niveau  JUNIOR ou INTERMEDIAIRE
use library;
SELECT distinct pub_id
FROM employees 
WHERE job_lvl = 'JUNIOR' OR  job_lvl = 'INTERMEDIAIRE';

;

SELECT * 
FROM publishers p
WHERE p.pub_id IN (SELECT  pub_id
FROM employees 
WHERE job_lvl IN ( 'JUNIOR' ,'INTERMEDIAIRE'));

-- Quels sont les editeurs employant au moins deux employes de niveau JUNIOR
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