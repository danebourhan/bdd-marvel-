DROP TABLE IF EXISTS acteurs ;
CREATE TABLE acteurs (id_acteurs INT AUTO_INCREMENT NOT NULL,
prénom VARCHAR(50),
nom VARCHAR(50),
date_de_naissance DATE,
PRIMARY KEY (id_acteurs)) ENGINE=InnoDB;

DROP TABLE IF EXISTS film ;
CREATE TABLE film (id_film INT AUTO_INCREMENT NOT NULL,
titre VARCHAR(50),
durée TIME,
date_de_sortie DATE,
PRIMARY KEY (id_film)) ENGINE=InnoDB;

DROP TABLE IF EXISTS réalisateur ;
CREATE TABLE réalisateur (id_réalisateur INT AUTO_INCREMENT NOT NULL,
prénom VARCHAR(50),
PRIMARY KEY (id_réalisateur)) ENGINE=InnoDB;

DROP TABLE IF EXISTS Utilisateurs ;
CREATE TABLE Utilisateurs (id_utilsateur INT AUTO_INCREMENT NOT NULL,
prénom_Utilisateurs VARCHAR(50),
email VARCHAR(50),
mot_de_passe VARCHAR(50),
Role_utilisateur VARCHAR(50),
PRIMARY KEY (id_utilsateur)) ENGINE=InnoDB;

DROP TABLE IF EXISTS a_joué_dans ;
CREATE TABLE a_joué_dans (id_acteurs INT AUTO_INCREMENT NOT NULL,
id_film INT NOT NULL,
role_acteur VARCHAR(50),
PRIMARY KEY (id_acteurs,
 id_film)) ENGINE=InnoDB;

DROP TABLE IF EXISTS a_réalisé ;
CREATE TABLE a_réalisé (id_film INT AUTO_INCREMENT NOT NULL,
id_réalisateur INT NOT NULL,
PRIMARY KEY (id_film,
 id_réalisateur)) ENGINE=InnoDB;

DROP TABLE IF EXISTS film_favoris ;
CREATE TABLE film_favoris (id_utilsateur INT AUTO_INCREMENT NOT NULL,
id_film INT NOT NULL,
PRIMARY KEY (id_utilsateur,
 id_film)) ENGINE=InnoDB;

ALTER TABLE a_joué_dans ADD CONSTRAINT FK_a_joué_dans_id_acteurs FOREIGN KEY (id_acteurs) REFERENCES acteurs (id_acteurs);

ALTER TABLE a_joué_dans ADD CONSTRAINT FK_a_joué_dans_id_film FOREIGN KEY (id_film) REFERENCES film (id_film);
ALTER TABLE a_réalisé ADD CONSTRAINT FK_a_réalisé_id_film FOREIGN KEY (id_film) REFERENCES film (id_film);
ALTER TABLE a_réalisé ADD CONSTRAINT FK_a_réalisé_id_réalisateur FOREIGN KEY (id_réalisateur) REFERENCES réalisateur (id_réalisateur);
ALTER TABLE film_favoris ADD CONSTRAINT FK_film_favoris_id_utilsateur FOREIGN KEY (id_utilsateur) REFERENCES Utilisateurs (id_utilsateur);
ALTER TABLE film_favoris ADD CONSTRAINT FK_film_favoris_id_film FOREIGN KEY (id_film) REFERENCES film (id_film);
