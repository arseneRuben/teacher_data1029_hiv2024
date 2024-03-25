drop database if exists library;
Create database if not exists library;
use library;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 05 fév. 2024 à 18:53
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
SET FOREIGN_KEY_CHECKS=0;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `library`
--

-- --------------------------------------------------------

--
-- Structure de la table `authors`
--

CREATE TABLE `authors` (
  `au_id` int(11) NOT NULL,
  `au_fname` varchar(100) DEFAULT NULL,
  `au_lname` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `contract` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `authors`
--

INSERT INTO `authors` (`au_id`, `au_fname`, `au_lname`, `phone`, `address`, `city`, `state`, `zip`, `contract`) VALUES
(1, 'Manu', 'Dibango', '+3359895965', '3 PLACE SAINTE CLAIRE\r\n', 'GRENOBLE', 'FRANCE', '49270', 200),
(2, 'Alain \r\n', 'Hertz', '+45678945132', '1750 Avenue Van Horne', 'Montreal', 'Quebec', 'H2L2X5', 320),
(3, 'Kalla', 'Christiant', '+4505935965', '818 Upper Aboujagane rt', 'Moncton', 'New Brunswick', 'NB E1C 1R9', 122),
(4, 'Merley', 'Bob', '+4564894522', '450 Londres', 'Trois-Rivieres', 'Quebec', 'H2L3X5', 130),
(5, 'Cheick', 'Anta Diop', '+221 33445521', 'Universite Cheick Anta Dipop', 'Dakar', 'Senegal', 'SN492343', 355);

--
-- Structure de la table `jobs`
--

CREATE TABLE `jobs` (
  `job_id` int(11) NOT NULL,
  `job_desc` varchar(255) DEFAULT NULL,
  `min_lvl` enum('STAGIAIRE','JUNIOR','INTERMEDIARE','SEINIOR') DEFAULT NULL,
  `max_lvl` enum('STAGIAIRE','JUNIOR','INTERMEDIARE','SEINIOR','MANAGER') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `jobs`
--

INSERT INTO `jobs` (`job_id`, `job_desc`, `min_lvl`, `max_lvl`) VALUES
(1, 'Webeditor', 'INTERMEDIARE', 'SEINIOR'),
(2, 'Correcteur', 'STAGIAIRE', 'SEINIOR'),
(3, 'Webmaster', 'INTERMEDIARE', 'SEINIOR'),
(4, 'Traducteur', 'STAGIAIRE', 'SEINIOR'),
(5, 'Imprimeur', 'STAGIAIRE', 'SEINIOR'),
(6, 'Designer', 'JUNIOR', 'SEINIOR'),
(7, 'Journalist', 'JUNIOR', 'MANAGER')
;
-- --------------------------------------------------------

--
-- Structure de la table `employees`
--

CREATE TABLE `employees` (
  `emp_id` int(11) NOT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `lname` varchar(100) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `job_lvl` enum('STAGIAIRE','JUNIOR','INTERMEDIARE','SEINIOR') DEFAULT NULL,
  `pub_id` int(11) DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `salary` int(2) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `employees`
--

INSERT INTO `employees` (`emp_id`, `fname`, `lname`, `job_id`, `job_lvl`, `pub_id`, `hire_date`, `salary`) VALUES
(1, 'Emmanuel', 'Bopda', 4, 'JUNIOR', 1, '2024-01-17', 25),
(2, 'Stephane', 'Lapointe', 3, 'SEINIOR', 3, '2024-01-10', 35),
(3, 'Albert', 'Einstein', 4, 'MANAGER', 1, '1924-01-17', 25),
(4, 'Paolo', 'Lockman', 3, 'SEINIOR', 2, '1994-03-04', 40),
(5, 'Christ', 'Danick', 6, 'INTERMEDIARE', 2, '2014-01-17', 33),
(6, 'Alain', 'Savoie', 5, 'SEINIOR', 5, '2018-04-17', 55),
(7, 'Alima', 'Traore', 5, 'JUNIOR', 2, '2023-11-17', 33),
(8, 'Roxane', 'David', 3, 'JUNIOR', 5, '2023-04-17', 25),
(9, 'Daniel', 'Akan', 4, 'STAGIAIRE', 1, '2023-12-31', 22),
(10, 'Eric', 'Toto', 3, 'INTERMEDIARE', 4, '2017-03-24', 30),
(11, 'Daniel', 'Akan', 4, 'STAGIAIRE', 3, '2023-12-31', 22),
(12, 'Norbert', 'Zongo', 7, 'INTERMEDIARE', 4, '2017-03-24', 30),
(13, 'Valere', 'Ewane', 2, 'MANAGER', 7, '2004-11-27', 35),
(14, 'Abdoulaye', 'Sangare', 3, 'SEINIOR', 6, '2017-11-14', 30),
(15, 'Martinez', 'Zogo', 7, 'INTERMEDIARE', 6, '2014-01-17', 33),
(16, 'Alain', 'Foka', 7, 'SEINIOR', 5, '2018-04-17', 55);

-- --------------------------------------------------------



-- --------------------------------------------------------

--
-- Structure de la table `publishers`
--

CREATE TABLE `publishers` (
  `pub_id` int(11) NOT NULL,
  `pub_name` varchar(55) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `publishers`
--

INSERT INTO `publishers` (`pub_id`, `pub_name`, `city`, `state`, `country`) VALUES
(1, 'Harmattan', 'Paris', 'France', 'France'),
(2, 'Eyrolles', 'Lyon', 'France', 'France'),
(3, 'Macmillan', 'Londres', 'Royaume-Unis', 'Royaume-Unis'),
(4, 'Boreal', 'Montreal', 'Quebec', 'Canada'),
(5, 'Disney', 'Anaheim', 'Californie', 'Etats-Unis'),
(6, 'Lepage', 'Moncton', 'NB', 'Canada');

-- --------------------------------------------------------

--
-- Structure de la table `sales`
--

CREATE TABLE `sales` (
  `stor_id` int(11) NOT NULL,
  `ord_num` int(11) NOT NULL,
  `title_id` int(11) NOT NULL,
  `ord_date` date DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `paytemrs` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `sales`
--

INSERT INTO `sales` (`stor_id`, `ord_num`, `title_id`, `ord_date`, `qty`, `paytemrs`) VALUES
(1, 1, 11, '2023-12-05', 2, NULL),
(1, 2, 11, '2013-02-05', 2, NULL),
(3, 1, 3, '2017-10-11', 3, NULL),
(4, 2, 3, '2007-10-01', 4, NULL),
(5, 2, 1, '2013-12-05', 5, NULL),
(6, 2, 4, '2023-02-05', 6, NULL),
(7, 3, 4, '2007-10-11', 4, NULL),
(8, 3, 5, '2017-10-01', 4, NULL),
(9, 3, 1, '2020-12-05', 3, NULL),
(10, 4, 4, '2010-02-05', 2, NULL),
(11, 4, 7, '2015-10-11', 1, NULL),
(12, 4, 7, '2004-10-01', 3, NULL),
(13, 5, 11, '2013-12-05', 12, NULL),
(14, 5, 4, '2014-02-05', 4, NULL),
(15, 5, 6, '2015-10-11', 5, NULL),
(16, 1, 9, '2019-10-01', 2, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `stores`
--

CREATE TABLE `stores` (
  `stor_id` int(11) NOT NULL,
  `stor_name` varchar(255) DEFAULT NULL,
  `stor_address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(55) DEFAULT NULL,
  `zip` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `stores`
--

INSERT INTO `stores` (`stor_id`, `stor_name`, `stor_address`, `city`, `state`, `zip`) VALUES
(1, 'abdel', '187 Botsford St', 'Moncton', 'Nouveau Brunswick', 'E1C1R9'),
(2, 'Le passage', '232 Botsford St,', 'Dieppe', 'Nouveau Brunswick', 'E1C 4X7'),
(3, 'Banq', '475 Boul. de Maisonneuve E ', 'Montréal', 'Quebec', 'H2L5C4'),
(4, 'Bibliotheque Paul-Mercier', '1003 Rue de la Mairie', 'Blainville', 'Quebec', 'J7C 3C7');

-- --------------------------------------------------------

--
-- Structure de la table `titleauthor`
--

CREATE TABLE `titleauthor` (
  `au_id` int(11) NOT NULL,
  `title_id` int(11) NOT NULL,
  `au_ord` int(2) DEFAULT NULL,
  `royaltyper` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `titleauthor`
--

INSERT INTO `titleauthor` (`au_id`, `title_id`, `au_ord`, `royaltyper`) VALUES
(1, 5, 1, 2),
(1, 7, 1, 1),
(2, 4, 1, 2),
(2, 5, 1, 2),
(2, 9, 1, 2),
(3, 9, 1, 1),
(4, 5, 1, NULL),
(4, 10, 2, 2),
(5, 12, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `titles`
--

CREATE TABLE `titles` (
  `title_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(25) DEFAULT NULL,
  `pub_id` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `advance` float DEFAULT NULL,
  `royalty` float DEFAULT NULL,
  `ytd_sales` float DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `pubdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `titles`
--

INSERT INTO `titles` (`title_id`, `title`, `type`, `pub_id`, `price`, `advance`, `royalty`, `ytd_sales`, `notes`, `pubdate`) VALUES
(1, 'The Canadian Constitution', 'poche', 1, 19, 3, 3, 3, 'Constitution canadienne sous forme de livre de poche', '2014-01-09'),
(2, 'Pour le liberalisme Communautaire', 'business', 2, 23, 2, 1, 3, 'Doctrine politique de Paul Barthelemy Biya ', '2010-01-01'),
(3, 'Introduction a l\'Algorithmique', 'Informatique', 2, 24, 2, 3, 3, 'Pour se familiariser au domaine de la programmation independamment du langage', '1994-01-08'),
(4, 'Php and Mysql', 'Informatique', 3, 65, 20, 40, 20, 'Web database application with Php and Mysql', '2004-03-10'),
(5, 'The Armour of Light', 'roman', 3, 49, 2, 3.4, 3.1, 'American love story', '1914-03-02'),
(6, 'Zangalewa', 'roman', 3, 19, 2, 2.4, 1.1, 'American adventure story', '1934-03-02'),
(7, 'Histoire de la Méchante Reine', 'roman', 4, 9, 2, 3.4, 3.1, 'Fairest of All : A Tale of the Wicked Queen', '1934-04-04'),
(8, 'Computer science ', 'computer', 4, 13, 10, 3, 2, 'Computer science from zero to hero', '2013-02-03'),
(9, 'Master Computers and network  ', 'Informatique', 4, 13, 10, 3, 2, 'Master Computer science ', '2023-01-03'),
(10, 'Sur de soi  ', 'psychology', 4, 13, 10, 3, 2, 'Psy de poche ', '1998-02-03'),
(11, 'Bus de la STM ', 'Transport', 2, 1, 1, 1, 3, 'Comprendre', '2008-02-03'),
(12, 'Alerte sous les tropiques', 'business', 1, 65, 20, 3, 3, 'Ceux-ci constituent la trame du combat permanent qu\'il a mené pour la Culture et le développement en Afrique noire. ', '1974-01-16');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`au_id`);

--
-- Index pour la table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `fk_employees_publishers` (`pub_id`),
  ADD KEY `fk_employees_jobss` (`job_id`);

--
-- Index pour la table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`job_id`);

--
-- Index pour la table `publishers`
--
ALTER TABLE `publishers`
  ADD PRIMARY KEY (`pub_id`);

--
-- Index pour la table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`stor_id`,`ord_num`,`title_id`),
  ADD KEY `FK_SALES_TITLES` (`title_id`);

--
-- Index pour la table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`stor_id`);

--
-- Index pour la table `titleauthor`
--
ALTER TABLE `titleauthor`
  ADD PRIMARY KEY (`au_id`,`title_id`),
  ADD KEY `fk_author_title` (`title_id`);

--
-- Index pour la table `titles`
--
ALTER TABLE `titles`
  ADD PRIMARY KEY (`title_id`),
  ADD KEY `fk_titles_publishers` (`pub_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `authors`
--
ALTER TABLE `authors`
  MODIFY `au_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `employees`
--
ALTER TABLE `employees`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `job_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `publishers`
--
ALTER TABLE `publishers`
  MODIFY `pub_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `stores`
--
ALTER TABLE `stores`
  MODIFY `stor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `titles`
--
ALTER TABLE `titles`
  MODIFY `title_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `fk_employees_jobss` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`),
  ADD CONSTRAINT `fk_employees_publishers` FOREIGN KEY (`pub_id`) REFERENCES `publishers` (`pub_id`)/*,
  ADD  CONSTRAINT check_value_range CHECK (job_lvl >= (SELECT min_lvl FROM jobs WHERE jobs.job_id = employees.job_id) AND value <= (SELECT max_lvl FROM jobs WHERE jobs.job_id = employees.job_id))*/;


--
-- Contraintes pour la table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `FK_SALES_STORES` FOREIGN KEY (`stor_id`) REFERENCES `stores` (`stor_id`),
  ADD CONSTRAINT `FK_SALES_TITLES` FOREIGN KEY (`title_id`) REFERENCES `titles` (`title_id`);

--
-- Contraintes pour la table `titleauthor`
--
ALTER TABLE `titleauthor`
  ADD CONSTRAINT `fk_author_title` FOREIGN KEY (`title_id`) REFERENCES `titles` (`title_id`),
  ADD CONSTRAINT `fk_title_author` FOREIGN KEY (`au_id`) REFERENCES `authors` (`au_id`);

--
-- Contraintes pour la table `titles`
--
ALTER TABLE `titles`
  ADD CONSTRAINT `fk_titles_publishers` FOREIGN KEY (`pub_id`) REFERENCES `publishers` (`pub_id`);
COMMIT;
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


-- 1. Noms complets des employés de plus haut grade par employeurs
-- Les plus hauts grades par employeurs
 SELECT
  CONCAT (e.fname, ' ', e.lname) AS employee_name,
  e.job_lvl,
  p.pub_name AS employer
FROM
  employees e
  JOIN publishers p ON e.pub_id = p.pub_id
WHERE (p.pub_id ,   e.job_lvl) IN (
		-- Les postes occupe de plus haut grade  par employeur
		SELECT pub_id, MAX( emp.job_lvl) AS max_job
		FROM employees emp JOIN jobs j ON emp.job_id = j.job_id
		GROUP BY pub_id
);

  
SELECT CONCAT( fname, " ", lname) AS fullname, job_lvl, pub_name
FROM employees e JOIN publishers p ON e.pub_id = p. pub_id
WHERE job_lvl=( SELECT MAX(job_lvl) FROM employees
WHERE pub_id = e.pub_id);


-- 2. Noms complets des employés ayant un salaire supérieur à celui de Norbert Zongo   
SELECT
  CONCAT (e.fname, ' ', e.lname) AS employee_name, e.salary
FROM
  employees e
  JOIN employees e2 ON e.salary > e2.salary
  AND e2.lname = 'Zongo'
  AND e2.fname = 'Norbert';
  
-- 3. Noms complets des employés des éditeurs canadiens
SELECT
  CONCAT (e.fname, ' ', e.lname) AS employee_name
FROM
  employees e
  JOIN publishers p ON e.pub_id = p.pub_id
WHERE
  p.country = 'Canada';

-- 4. Noms complets des employés qui ont un manager
 SELECT
  CONCAT (e.fname, ' ', e.lname) AS employee_name,
  e.job_lvl,
  p.pub_name AS employer
FROM
  employees e
  JOIN publishers p ON e.pub_id = p.pub_id
WHERE p.pub_id IN (
-- employeur ayant un manager
SELECT pub_id
		FROM employees WHERE job_lvl = "SEINIOR"
) ORDER BY employer;


SELECT * FROM employees;
SELECT
  CONCAT (e.fname, ' ', e.lname) AS employee_name
FROM
  employees e
WHERE
  job_id IN (
    SELECT
      job_id
    FROM
      jobs
    WHERE
      job_desc = 'MANAGER'
  );

-- 5. Noms complets des employés qui ont un salaire au-dessus de la moyenne de salaire chez leur employeur
SELECT
  CONCAT (e.fname, ' ', e.lname) AS employee_name
FROM
  employees e
  JOIN (
    SELECT
      pub_id,
      AVG(salary) AS avg_salary
    FROM
      employees
    GROUP BY
      pub_id
  ) AS avg_sal ON e.pub_id = avg_sal.pub_id
WHERE
  e.salary > avg_sal.avg_salary;

  -- OU ENCORE 
  SELECT CONCAT(e.fname, ' ', e.lname) AS Nom_Complet, e.salary, p.pub_name
FROM employees e
JOIN publishers p ON e.pub_id = p.pub_id
WHERE e.salary > (
    SELECT AVG(e.salary)
    FROM employees e
    WHERE p.pub_id = e.pub_id
);

-- 6. Noms complets des employés qui ont le salaire minimum de leur grade
SELECT
  CONCAT (e.fname, ' ', e.lname) AS employee_name
FROM
  employees e
  
WHERE (e.salary, e.job_lvl) IN
 (
    SELECT
      MIN(salary), employees.job_lvl
    FROM
      employees
    GROUP BY employees.job_lvl

  );

-- 7. De quels types sont les livres les plus vendus?
-- DANS CETTE APPROCHE, ON CHERCHE LE LIVRE LE PLUS VENDU AVANT DE TROUVER SON TYPE
SELECT
  type
FROM
  titles
WHERE
  title_id IN (
    SELECT
      title_id
    FROM
      sales
    GROUP BY
      title_id
    ORDER BY
      SUM(qty) DESC
    LIMIT
      1
  );
  -- OU ENCORE 
  -- ICI ON REGROUPE LES VENTES DE LIVRE PAR TYPE ET ON EXAMINE CE TYPE QUI EST PLUS VENDU
  SELECT t.type
FROM titles t
JOIN sales s ON t.title_id = s.title_id
GROUP BY t.type
ORDER BY SUM(s.qty) DESC;

-- LES DEUX DONNENT DES RESULTATS DIFFERENTS, MAIS ON VALIDE LES 2


-- 8. Pour chaque boutique, les 2 livres les plus vendus et leurs prix
  
  (SELECT s.stor_id, s.title_id,t.title, SUM(qty) AS total_qty
  FROM sales s JOIN titles t on t.title_id = s.title_id
  WHERE s.stor_id = 1
  GROUP BY  s.title_id
  ORDER BY total_qty DESC
  limit 2)
  UNION
  (SELECT s.stor_id, s.title_id,t.title, SUM(qty) AS total_qty
  FROM sales s JOIN titles t on t.title_id = s.title_id
  WHERE s.stor_id = 2
  GROUP BY  s.title_id
  ORDER BY total_qty DESC
  limit 2)
  UNION
  (SELECT s.stor_id, s.title_id,t.title, SUM(qty) AS total_qty
  FROM sales s JOIN titles t on t.title_id = s.title_id
  WHERE s.stor_id = 3
  GROUP BY  s.title_id
  ORDER BY total_qty DESC
  limit 2)
  UNION
  (SELECT s.stor_id, s.title_id,t.title, SUM(qty) AS total_qty
  FROM sales s JOIN titles t on t.title_id = s.title_id
  WHERE s.stor_id = 4
  GROUP BY  s.title_id
  ORDER BY total_qty DESC
  limit 2)
  UNION
  (SELECT s.stor_id, s.title_id,t.title, SUM(qty) AS total_qty
  FROM sales s JOIN titles t on t.title_id = s.title_id
  WHERE s.stor_id = 5
  GROUP BY  s.title_id
  ORDER BY total_qty DESC
  limit 2)
  UNION
  (SELECT s.stor_id, s.title_id,t.title, SUM(qty) AS total_qty
  FROM sales s JOIN titles t on t.title_id = s.title_id
  WHERE s.stor_id = 6
  GROUP BY  s.title_id
  ORDER BY total_qty DESC
  limit 2)
  UNION
  (SELECT s.stor_id, s.title_id,t.title, SUM(qty) AS total_qty
  FROM sales s JOIN titles t on t.title_id = s.title_id
  WHERE s.stor_id = 7
  GROUP BY  s.title_id
  ORDER BY total_qty DESC
  limit 2)
  UNION
  (SELECT s.stor_id, s.title_id,t.title, SUM(qty) AS total_qty
  FROM sales s JOIN titles t on t.title_id = s.title_id
  WHERE s.stor_id = 8
  GROUP BY  s.title_id
  ORDER BY total_qty DESC
  limit 2)
  UNION
  (SELECT s.stor_id, s.title_id,t.title, SUM(qty) AS total_qty
  FROM sales s JOIN titles t on t.title_id = s.title_id
  WHERE s.stor_id = 9
  GROUP BY  s.title_id
  ORDER BY total_qty DESC
  limit 2);
  ...


-- 9. Les auteurs des 5 livres les plus vendus
SELECT
  CONCAT (a.au_fname, ' ', a.au_lname) AS author_name
FROM
  authors a
  JOIN titleauthor ta ON a.au_id = ta.au_id
WHERE
  ta.title_id IN (
    SELECT
      title_id
    FROM
      sales
    GROUP BY
      title_id
    ORDER BY
    SUM(qty) DESC
  
  );
  
  -- OU ENCORE
  SELECT a.au_id, CONCAT(a.au_fname, ' ', a.au_lname) AS author_name, SUM(s.qty) AS total_sales
FROM titles t
INNER JOIN sales s ON t.title_id = s.title_id
INNER JOIN titleauthor ta ON t.title_id = ta.title_id
INNER JOIN authors a ON ta.au_id = a.au_id
GROUP BY a.au_id, author_name
ORDER BY total_sales DESC
LIMIT 5;

-- 10. Prix moyens des livres par maisons d’édition
SELECT
  p.pub_name,
  AVG(t.price) AS avg_price
FROM
  publishers p
  JOIN titles t ON p.pub_id = t.pub_id
GROUP BY
  p.pub_name;

-- 11. Les 3 auteurs ayant les plus de livres
SELECT
  CONCAT (a.au_fname, ' ', a.au_lname) AS author_name,
  COUNT(ta.title_id) AS num_books
FROM
  authors a
  JOIN titleauthor ta ON a.au_id = ta.au_id
GROUP BY
  a.au_id
ORDER BY
  num_books DESC
LIMIT
  3;
  
