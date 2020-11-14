-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : Dim 01 nov. 2020 à 12:34
-- Version du serveur :  10.4.13-MariaDB
-- Version de PHP : 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion commerciale`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `code` varchar(10) NOT NULL,
  `designation` varchar(200) NOT NULL,
  `price` decimal(10,3) DEFAULT NULL,
  `stock` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`code`, `designation`, `price`, `stock`) VALUES
('REAR001', 'Refrigerateur Arcleik 450l', '1450.666', '0'),
('REBL001', 'Refrigerateur Mont Blac', '1250.666', '0'),
('TVTH001', 'Télévison Sumsung 32', '560.450', '0');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `code_client` varchar(10) NOT NULL,
  `raison_social` varchar(50) NOT NULL,
  `adresse` varchar(200) DEFAULT NULL,
  `ville` varchar(50) DEFAULT NULL,
  `CA` decimal(10,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`code_client`, `raison_social`, `adresse`, `ville`, `CA`) VALUES
('cl001', 'Carrefour', 'Avenue de Mars', 'Mahida', '0.000');

-- --------------------------------------------------------

--
-- Structure de la table `factureachat`
--

CREATE TABLE `factureachat` (
  `NumeroFA` varchar(10) NOT NULL,
  `date_FA` date DEFAULT NULL,
  `codeFR` varchar(10) DEFAULT NULL,
  `Totale` decimal(10,5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `factureachat`
--

INSERT INTO `factureachat` (`NumeroFA`, `date_FA`, `codeFR`, `Totale`) VALUES
('01/2020', '2020-11-01', '0150', '2500.20000');

-- --------------------------------------------------------

--
-- Structure de la table `facture_vente`
--

CREATE TABLE `facture_vente` (
  `numero` varchar(10) NOT NULL,
  `date_fature_achat` date DEFAULT NULL,
  `client` varchar(10) DEFAULT NULL,
  `mnt_totale` decimal(10,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `facture_vente`
--

INSERT INTO `facture_vente` (`numero`, `date_fature_achat`, `client`, `mnt_totale`) VALUES
('2020/001', NULL, 'cl001', '1000.000');

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

CREATE TABLE `fournisseur` (
  `CodeFR` varchar(10) NOT NULL,
  `RaisonSociale` varchar(50) NOT NULL,
  `Adresse` varchar(200) NOT NULL,
  `Ville` varchar(50) NOT NULL,
  `ChifreAffiareFr` decimal(10,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `fournisseur`
--

INSERT INTO `fournisseur` (`CodeFR`, `RaisonSociale`, `Adresse`, `Ville`, `ChifreAffiareFr`) VALUES
('0150', 'Badie Sakka', '25 Rue Moncef Bey 5100 Mahdia', 'Mahdia', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `lignefa`
--

CREATE TABLE `lignefa` (
  `NumeroFA` varchar(10) NOT NULL,
  `code` varchar(10) NOT NULL,
  `Quantite` decimal(10,0) NOT NULL,
  `Prix` decimal(10,5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `ligne_facteur_vente`
--

CREATE TABLE `ligne_facteur_vente` (
  `numero_fact` char(10) NOT NULL,
  `article` varchar(10) DEFAULT NULL,
  `qte` decimal(10,3) DEFAULT NULL,
  `prix` decimal(10,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `ligne_facteur_vente`
--

INSERT INTO `ligne_facteur_vente` (`numero_fact`, `article`, `qte`, `prix`) VALUES
('2020/001', 'TVTH001', '10.000', '200.000');

-- --------------------------------------------------------

--
-- Structure de la table `reglement_client`
--

CREATE TABLE `reglement_client` (
  `numero` varchar(10) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `date_reglement` date DEFAULT NULL,
  `facture` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `reglemetnfr`
--

CREATE TABLE `reglemetnfr` (
  `NumeroReglementFR` varchar(10) NOT NULL,
  `Type` varchar(10) NOT NULL,
  `DateReglementFR` date NOT NULL,
  `NumeroFA` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`code`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`code_client`);

--
-- Index pour la table `factureachat`
--
ALTER TABLE `factureachat`
  ADD PRIMARY KEY (`NumeroFA`),
  ADD KEY `codeFR` (`codeFR`);

--
-- Index pour la table `facture_vente`
--
ALTER TABLE `facture_vente`
  ADD PRIMARY KEY (`numero`),
  ADD KEY `client` (`client`);

--
-- Index pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  ADD PRIMARY KEY (`CodeFR`);

--
-- Index pour la table `lignefa`
--
ALTER TABLE `lignefa`
  ADD KEY `NumeroFA` (`NumeroFA`),
  ADD KEY `code` (`code`);

--
-- Index pour la table `ligne_facteur_vente`
--
ALTER TABLE `ligne_facteur_vente`
  ADD PRIMARY KEY (`numero_fact`),
  ADD KEY `article` (`article`);

--
-- Index pour la table `reglement_client`
--
ALTER TABLE `reglement_client`
  ADD KEY `facture` (`facture`);

--
-- Index pour la table `reglemetnfr`
--
ALTER TABLE `reglemetnfr`
  ADD PRIMARY KEY (`NumeroReglementFR`),
  ADD KEY `NumeroFA` (`NumeroFA`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `factureachat`
--
ALTER TABLE `factureachat`
  ADD CONSTRAINT `factureachat_ibfk_1` FOREIGN KEY (`codeFR`) REFERENCES `fournisseur` (`CodeFR`);

--
-- Contraintes pour la table `facture_vente`
--
ALTER TABLE `facture_vente`
  ADD CONSTRAINT `facture_vente_ibfk_1` FOREIGN KEY (`client`) REFERENCES `client` (`code_client`);

--
-- Contraintes pour la table `lignefa`
--
ALTER TABLE `lignefa`
  ADD CONSTRAINT `lignefa_ibfk_1` FOREIGN KEY (`NumeroFA`) REFERENCES `factureachat` (`NumeroFA`),
  ADD CONSTRAINT `lignefa_ibfk_2` FOREIGN KEY (`code`) REFERENCES `article` (`code`);

--
-- Contraintes pour la table `ligne_facteur_vente`
--
ALTER TABLE `ligne_facteur_vente`
  ADD CONSTRAINT `ligne_facteur_vente_ibfk_1` FOREIGN KEY (`article`) REFERENCES `article` (`code`);

--
-- Contraintes pour la table `reglement_client`
--
ALTER TABLE `reglement_client`
  ADD CONSTRAINT `reglement_client_ibfk_1` FOREIGN KEY (`facture`) REFERENCES `facture_vente` (`numero`);

--
-- Contraintes pour la table `reglemetnfr`
--
ALTER TABLE `reglemetnfr`
  ADD CONSTRAINT `reglemetnfr_ibfk_1` FOREIGN KEY (`NumeroFA`) REFERENCES `factureachat` (`NumeroFA`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
