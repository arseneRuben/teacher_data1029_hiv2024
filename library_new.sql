-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 24 jan. 2024 à 14:11
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

DROP DATABASE library;
CREATE DATABASE IF NOT EXISTS library;
USE library;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `library`
--

-- --------------------------------------------------------

--
-- Structure de la table `publishers`
--

CREATE TABLE IF NOT EXISTS `publishers` (
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
(1, 'Harmattan', 'Paris', NULL, 'France'),
(2, 'Eyrolles', 'Lyon', NULL, 'France'),
(3, 'Macmillan', 'Londres', NULL, 'Royaume-Unis'),
(4, 'Boreal', 'Montreal', 'Quebec', 'Canada'),
(5, 'Disney', 'Anaheim', 'Californie', 'Etats-Unis');

-- --------------------------------------------------------

--
-- Structure de la table `titles`
--

CREATE TABLE IF NOT EXISTS `titles` (
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
(2, 'Pour le liberalisme Communautaire', 'Politique', 2, 23, 2, 1, 3, 'Doctrine politique de Paul Barthelemy Biya ', '2010-01-01'),
(3, 'Introduction a l\'Algorithmique', 'Informatique', 2, 24, 2, 3, 3, 'Pour se familiariser au domaine de la programmation independamment du langage', '1994-01-08'),
(4, 'Php and Mysql', 'Informatique', 3, 65, 20, 40, 20, 'Web database application with Php and Mysql', '2004-03-10'),
(5, 'The Armour of Light', 'roman', 3, 49, 2, 3.4, 3.1, 'American love story', '1914-03-02'),
(6, 'The Seven Sisters Tome 1Maia Story', 'roman', 3, 19, 2, 2.4, 1.1, 'American adventure story', '1934-03-02'),
(7, 'Histoire de la Méchante Reine', 'roman', 4, 9, 2, 3.4, 3.1, 'Fairest of All : A Tale of the Wicked Queen', '1934-04-04');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `publishers`
--
ALTER TABLE `publishers`
  ADD PRIMARY KEY (`pub_id`);

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
-- AUTO_INCREMENT pour la table `publishers`
--
ALTER TABLE `publishers`
  MODIFY `pub_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `titles`
--
ALTER TABLE `titles`
  MODIFY `title_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `titles`
--
ALTER TABLE `titles`
  ADD CONSTRAINT `fk_titles_publishers` FOREIGN KEY (`pub_id`) REFERENCES `publishers` (`pub_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
