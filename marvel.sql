-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : db
-- Généré le : mer. 12 juil. 2023 à 10:21
-- Version du serveur : 8.0.29
-- Version de PHP : 8.0.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `marvel`
--

-- --------------------------------------------------------

--
-- Structure de la table `acteurs`
--

CREATE TABLE `acteurs` (
  `id_acteurs` int NOT NULL,
  `prénom` varchar(50) DEFAULT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `date_de_naissance` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `acteurs`
--

INSERT INTO `acteurs` (`id_acteurs`, `prénom`, `nom`, `date_de_naissance`) VALUES
(1, 'Chris', 'Pratt', '1979-06-21');

-- --------------------------------------------------------

--
-- Structure de la table `a_joué_dans`
--

CREATE TABLE `a_joué_dans` (
  `id_acteurs` int NOT NULL,
  `id_film` int NOT NULL,
  `role_acteur` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `a_réalisé`
--

CREATE TABLE `a_réalisé` (
  `id_film` int NOT NULL,
  `id_réalisateur` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `film`
--

CREATE TABLE `film` (
  `id_film` int NOT NULL,
  `titre` varchar(50) DEFAULT NULL,
  `durée` time DEFAULT NULL,
  `date_de_sortie` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `film_favoris`
--

CREATE TABLE `film_favoris` (
  `id_utilsateur` int NOT NULL,
  `id_film` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `réalisateur`
--

CREATE TABLE `réalisateur` (
  `id_réalisateur` int NOT NULL,
  `prénom` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Utilisateurs`
--

CREATE TABLE `Utilisateurs` (
  `id_utilsateur` int NOT NULL,
  `prénom_Utilisateurs` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `mot_de_passe` varchar(50) DEFAULT NULL,
  `Role_utilisateur` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `acteurs`
--
ALTER TABLE `acteurs`
  ADD PRIMARY KEY (`id_acteurs`);

--
-- Index pour la table `a_joué_dans`
--
ALTER TABLE `a_joué_dans`
  ADD PRIMARY KEY (`id_acteurs`,`id_film`),
  ADD KEY `FK_a_joué_dans_id_film` (`id_film`);

--
-- Index pour la table `a_réalisé`
--
ALTER TABLE `a_réalisé`
  ADD PRIMARY KEY (`id_film`,`id_réalisateur`),
  ADD KEY `FK_a_réalisé_id_réalisateur` (`id_réalisateur`);

--
-- Index pour la table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id_film`);

--
-- Index pour la table `film_favoris`
--
ALTER TABLE `film_favoris`
  ADD PRIMARY KEY (`id_utilsateur`,`id_film`),
  ADD KEY `FK_film_favoris_id_film` (`id_film`);

--
-- Index pour la table `réalisateur`
--
ALTER TABLE `réalisateur`
  ADD PRIMARY KEY (`id_réalisateur`);

--
-- Index pour la table `Utilisateurs`
--
ALTER TABLE `Utilisateurs`
  ADD PRIMARY KEY (`id_utilsateur`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `acteurs`
--
ALTER TABLE `acteurs`
  MODIFY `id_acteurs` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `a_joué_dans`
--
ALTER TABLE `a_joué_dans`
  MODIFY `id_acteurs` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `a_réalisé`
--
ALTER TABLE `a_réalisé`
  MODIFY `id_film` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `film`
--
ALTER TABLE `film`
  MODIFY `id_film` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `film_favoris`
--
ALTER TABLE `film_favoris`
  MODIFY `id_utilsateur` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `réalisateur`
--
ALTER TABLE `réalisateur`
  MODIFY `id_réalisateur` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Utilisateurs`
--
ALTER TABLE `Utilisateurs`
  MODIFY `id_utilsateur` int NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `a_joué_dans`
--
ALTER TABLE `a_joué_dans`
  ADD CONSTRAINT `FK_a_joué_dans_id_acteurs` FOREIGN KEY (`id_acteurs`) REFERENCES `acteurs` (`id_acteurs`),
  ADD CONSTRAINT `FK_a_joué_dans_id_film` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`);

--
-- Contraintes pour la table `a_réalisé`
--
ALTER TABLE `a_réalisé`
  ADD CONSTRAINT `FK_a_réalisé_id_film` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`),
  ADD CONSTRAINT `FK_a_réalisé_id_réalisateur` FOREIGN KEY (`id_réalisateur`) REFERENCES `réalisateur` (`id_réalisateur`);

--
-- Contraintes pour la table `film_favoris`
--
ALTER TABLE `film_favoris`
  ADD CONSTRAINT `FK_film_favoris_id_film` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`),
  ADD CONSTRAINT `FK_film_favoris_id_utilsateur` FOREIGN KEY (`id_utilsateur`) REFERENCES `Utilisateurs` (`id_utilsateur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
