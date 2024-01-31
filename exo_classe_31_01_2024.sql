-- 1 Les noms et ids des éditeurs ayant publié des livres de type « business » ou des livres de type «psychology » 
---APPROCHE 1
------ Cherchons dans un premier temps les editeurs ayants publie des livre du type 'business' 
SELECT p.pub_name , p.pub_id 
FROM publishers p, titles t -- on prend les deux tables "publishers" et "titles" parce que la requette necessite qu'on examine les editeurs et les livres 
WHERE p.pub_id = t.pub_id AND t.type = 'business'; -- cette ligne permet de joindre les deux tables sur la base de la relation qui les lie(pub_id) et de s'assurer qu'on ne retient que les libre de type 'business'
------ Ensuite, de la meme facon, cherchons les editeurs ayants publie des livre du type 'psychology' 
SELECT p.pub_name , p.pub_id 
FROM publishers p, titles t 
WHERE p.pub_id = t.pub_id AND t.type = 'psychology';
------ Pour obtenir les editeurs ayant publie  des livres de type « business » ou des livres de type «psychology »
------ il suffit d'effectuer une UNION des deux precedents ensembles
SELECT p.pub_name , p.pub_id 
FROM publishers p, titles t   
WHERE p.pub_id = t.pub_id  AND t.type = 'business'
UNION 
SELECT p.pub_name , p.pub_id 
FROM publishers p, titles t  
WHERE p.pub_id = t.pub_id  AND t.type = 'psychology';

---APPROCHE 2
SELECT p.pub_name , p.pub_id 
FROM publishers p JOIN titles t ON p.pub_id = t.pub_id   -- equijointure
WHERE  t.type = 'business'
UNION 
SELECT p.pub_name , p.pub_id 
FROM publishers p JOIN titles t ON p.pub_id = t.pub_id 
WHERE t.type = 'psychology';

---APPROCHE 3
SELECT p.pub_name , p.pub_id 
FROM publishers p JOIN titles t ON p.pub_id = t.pub_id   -- equijointure
WHERE  t.type = 'business'      OR  t.type = 'psychology'


-- 2 Afficher les nom et id des éditeurs ayant publié des livres de type « business » et des livres de type «psychology »
SELECT p.pub_name , p.pub_id 
FROM publishers p JOIN titles t ON p.pub_id = t.pub_id   -- equijointure
WHERE  t.type = 'business'
INTERSECT 
SELECT p.pub_name , p.pub_id 
FROM publishers p JOIN titles t ON p.pub_id = t.pub_id 
WHERE t.type = 'psychology';

-- 3 Afficher les nom et id des éditeurs ayant publié des livres de type « business » mais pas de livre de type «psychology ».
SELECT p.pub_name , p.pub_id 
FROM publishers p JOIN titles t ON p.pub_id = t.pub_id   -- equijointure
WHERE  t.type = 'business'
EXCEPT 
SELECT p.pub_name , p.pub_id 
FROM publishers p JOIN titles t ON p.pub_id = t.pub_id 
WHERE t.type = 'psychology';