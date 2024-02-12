-- 1- Quels editeurs emploient des employes de niveau JUNIOR ou INTERMEDIAIRE
-- publishers, employees(job_lvl), 
-- --  les employes de niveau  JUNIOR ou INTERMEDIAIRE
use library;
SELECT emp_id, fname 
FROM employees 
WHERE job_lvl = 'JUNIOR' OR  job_lvl = 'INTERMEDIAIRE';

SELECT emp_id, fname 
FROM employees 
WHERE job_lvl IN ( 'JUNIOR' ,'INTERMEDIAIRE');