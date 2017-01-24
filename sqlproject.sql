-- Database: mini-projet-sql

-- DROP DATABASE "mini-projet-sql";

CREATE DATABASE "mini-projet-sql"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.UTF-8'
    LC_CTYPE = 'en_US.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
    
-- Dans ce cas vous ne devez faire que 3 requêtes sur les 6 et un seul déclencheur.

--
--
-- Contexte: Passage au relationnel du mini-projet Bases de données relationnel Licence MIDO 3ème année par alternance

-- Car on ne peut pas identifier un match uniquement par les trois attribus de la classe Match sur le diagramme UML, on ajoute
-- un attribut MatchID qui sera notre clé primaire. 

CREATE TABLE Match 
(
	matchID		SERIAL UNIQUE,
	date_match	DATE,
	heure_debut	TIME,
	heure_fin	TIME,
	CONSTRAINT pk_matchid PRIMARY KEY (matchID)
);

-- La table Equipe avec les attributs initiales et la clé primaire 'nom' identifiant un equipe

CREATE TABLE Equipe 
(
	nomequipe		VARCHAR,
	numJoueurs 		SMALLINT,
	CONSTRAINT pk_nom PRIMARY KEY (nom)
);


CREATE TABLE Joueur 
(
	numero 			SMALLINT,
	nom 			VARCHAR,
	prenom			VARCHAR,
	datenaissance	DATE,
	nomequipe		VARCHAR,
	CONSTRAINT pk_numero PRIMARY KEY (numero),
	CONSTRAINT fk_nomequipe FOREIGN KEY (nomequipe) REFERENCES Equipe (nomequipe)
);

-- Car Goalie a les mêmes attributes que Joueur, plutôt que dupliquer des attributs, 
-- on peut faire référence à Joueur dans la rélation Goalie par l'attribute commun numero. 
 
CREATE TABLE Goalie
(
	numero 			SMALLINT,
	CONSTRAINT pk_numero PRIMARY KEY (numero),
	CONSTRAINT fk_numero FOREIGN KEY (numero) REFERENCES Joueur (numero)
);

-- Car relation 1 - * entre But et bb  b Match / Joueur
CREATE TABLE But 
(
	heure 			TIME,
	matchID		INTEGER,
	numero_joueur	SMALLINT,
	CONSTRAINT pk_But PRIMARY KEY (heure, matchID, numero_joueur),
	CONSTRAINT fk_matchID FOREIGN KEY (matchID) REFERENCES Match(matchID),
	CONSTRAINT fk_numero_joueur FOREIGN KEY (numero_joueur) REFERENCES Joueur(numero_joueur)
);

CREATE TABLE Est_Dans_Le_Buts
(
	heure_debut			TIME,
	heure_fin			TIME,
	nb_buts_encaisses	SMALLINT,
	numero_joueur		SMALLINT,
	matchID 			INTEGER,
	CONSTRAINT pk_Est_Dans_Le_Buts	PRIMARY KEY (heure_debut, numero_joueur, matchID),
	CONSTRAINT numero_joueur FOREIGN KEY (numero_Joueur) REFERENCES Joueur (numero),
	CONSTRAINT fk_matchID FOREIGN KEY (matchID) REFERENCES Match(matchID)
);

TODO: Increase primary key joueur

