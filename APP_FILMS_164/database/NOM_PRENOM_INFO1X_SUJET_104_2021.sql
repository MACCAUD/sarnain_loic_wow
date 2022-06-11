-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mer 11 Mai 2022 à 08:08
-- Version du serveur :  5.7.11
-- Version de PHP :  5.6.18

DROP DATABASE IF EXISTS sarnain_loic_info1a_bd_164;

-- Création d'un nouvelle base de donnée

CREATE DATABASE IF NOT EXISTS sarnain_loic_info1a_bd_164;

USE sarnain_loic_info1a_bd_164;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `sarnain_loic_info1a_bd_164`
--

-- --------------------------------------------------------

--
-- Structure de la table `t_adresse`
--

CREATE TABLE `t_adresse` (
  `id_adresse` int(11) NOT NULL,
  `nom_adresse` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `t_adresse`
--

INSERT INTO `t_adresse` (`id_adresse`, `nom_adresse`) VALUES
(1, 'grand-rue 15');

-- --------------------------------------------------------

--
-- Structure de la table `t_mail`
--

CREATE TABLE `t_mail` (
  `id_mail` int(11) NOT NULL,
  `nom_mail` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `t_mail`
--

INSERT INTO `t_mail` (`id_mail`, `nom_mail`) VALUES
(1, 'loic.sarnain@gmail.com'),
(2, 'tolga.kilinc@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `t_personne`
--

CREATE TABLE `t_personne` (
  `id_personne` int(11) NOT NULL,
  `nom_personne` varchar(60) NOT NULL,
  `prenom_personne` varchar(60) NOT NULL,
  `date_de_naissance` date NOT NULL,
  `sexe_personne` varchar(34) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `t_personne`
--

INSERT INTO `t_personne` (`id_personne`, `nom_personne`, `prenom_personne`, `date_de_naissance`, `sexe_personne`) VALUES
(1, 'Echenard', 'Loris', '2006-02-12', 'homme'),
(2, 'Kilinc', 'Tolga', '2004-11-11', 'homme'),
(3, 'Sarnain', 'Loïc', '2005-12-22', 'homme');

-- --------------------------------------------------------

--
-- Structure de la table `t_personne_avoir_adresse`
--

CREATE TABLE `t_personne_avoir_adresse` (
  `id_personne_avoir_adresse` int(11) NOT NULL,
  `date_adresse` date NOT NULL,
  `fk_personne` int(11) NOT NULL,
  `fk_adresse` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `t_personne_avoir_mail`
--

CREATE TABLE `t_personne_avoir_mail` (
  `id_personne_avoir_mail` int(11) NOT NULL,
  `fk_personne` int(11) NOT NULL,
  `fk_mail` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `t_personne_avoir_mail`
--

INSERT INTO `t_personne_avoir_mail` (`id_personne_avoir_mail`, `fk_personne`, `fk_mail`) VALUES
(1, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `t_personne_avoir_telephone`
--

CREATE TABLE `t_personne_avoir_telephone` (
  `id_personne_avoir_telephone` int(11) NOT NULL,
  `fk_personne` int(11) NOT NULL,
  `fk_telephone` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `t_telephone`
--

CREATE TABLE `t_telephone` (
  `id_telephone` int(11) NOT NULL,
  `num_telephone` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `t_telephone`
--

INSERT INTO `t_telephone` (`id_telephone`, `num_telephone`) VALUES
(1, '079 399 17 63');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `t_adresse`
--
ALTER TABLE `t_adresse`
  ADD PRIMARY KEY (`id_adresse`),
  ADD KEY `nom_adresse` (`nom_adresse`);

--
-- Index pour la table `t_mail`
--
ALTER TABLE `t_mail`
  ADD PRIMARY KEY (`id_mail`),
  ADD KEY `nom_mail` (`nom_mail`);

--
-- Index pour la table `t_personne`
--
ALTER TABLE `t_personne`
  ADD PRIMARY KEY (`id_personne`),
  ADD KEY `nom_personne` (`nom_personne`,`prenom_personne`,`date_de_naissance`,`sexe_personne`);

--
-- Index pour la table `t_personne_avoir_adresse`
--
ALTER TABLE `t_personne_avoir_adresse`
  ADD PRIMARY KEY (`id_personne_avoir_adresse`),
  ADD KEY `date_adresse` (`date_adresse`,`fk_personne`,`fk_adresse`);

--
-- Index pour la table `t_personne_avoir_mail`
--
ALTER TABLE `t_personne_avoir_mail`
  ADD PRIMARY KEY (`id_personne_avoir_mail`),
  ADD KEY `fk_personne` (`fk_personne`,`fk_mail`);

--
-- Index pour la table `t_personne_avoir_telephone`
--
ALTER TABLE `t_personne_avoir_telephone`
  ADD PRIMARY KEY (`id_personne_avoir_telephone`),
  ADD KEY `fk_personne` (`fk_personne`,`fk_telephone`);

--
-- Index pour la table `t_telephone`
--
ALTER TABLE `t_telephone`
  ADD PRIMARY KEY (`id_telephone`),
  ADD KEY `num_telephone` (`num_telephone`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `t_adresse`
--
ALTER TABLE `t_adresse`
  MODIFY `id_adresse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `t_mail`
--
ALTER TABLE `t_mail`
  MODIFY `id_mail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `t_personne`
--
ALTER TABLE `t_personne`
  MODIFY `id_personne` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `t_personne_avoir_adresse`
--
ALTER TABLE `t_personne_avoir_adresse`
  MODIFY `id_personne_avoir_adresse` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `t_personne_avoir_mail`
--
ALTER TABLE `t_personne_avoir_mail`
  MODIFY `id_personne_avoir_mail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `t_personne_avoir_telephone`
--
ALTER TABLE `t_personne_avoir_telephone`
  MODIFY `id_personne_avoir_telephone` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `t_telephone`
--
ALTER TABLE `t_telephone`
  MODIFY `id_telephone` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

