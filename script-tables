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
	CONSTRAINT pk_nom PRIMARY KEY (nomequipe)
);


CREATE TABLE Joueur 
(
	numero 			SMALLINT,
	nomequipe		VARCHAR,
	nom 			VARCHAR,
	prenom			VARCHAR,
	datenaissance	DATE,
	CONSTRAINT pk_joueur PRIMARY KEY (numero,nomequipe),
	CONSTRAINT fk_nomequipe FOREIGN KEY (nomequipe) REFERENCES Equipe (nomequipe)
);

-- Car Goalie a les mêmes attributes que Joueur, plutôt que dupliquer des attributs, 
-- on peut faire référence à Joueur dans la rélation Goalie par la clé primaire (numero, nomequipe). 
 
CREATE TABLE Goalie
(
	numero 			SMALLINT,
	nomequipe		VARCHAR,
	CONSTRAINT pk_numero PRIMARY KEY (numero,nomequipe),
	CONSTRAINT fk_goalie FOREIGN KEY (numero,nomequipe) REFERENCES Joueur (numero,nomequipe)
);

-- Car relation 1 - * entre But et bb  b Match / Joueur
CREATE TABLE But 
(
	heure 		TIME,
	matchID		INTEGER,
	numero_joueur	SMALLINT,
	nomequipe	VARCHAR,
	CONSTRAINT pk_But PRIMARY KEY (heure, matchID, numero_joueur),
	CONSTRAINT fk_matchID FOREIGN KEY (matchID) REFERENCES Match(matchID),
	CONSTRAINT fk_joueur FOREIGN KEY (numero_joueur,nomequipe) REFERENCES Joueur(numero,nomequipe)
);

CREATE TABLE Est_Dans_Le_Buts
(
	heure_debut		TIME,
	heure_fin		TIME,
	nb_buts_encaisses	SMALLINT,
	numero_joueur		SMALLINT,
	nomequipe		VARCHAR,
	matchID 		INTEGER,
	CONSTRAINT pk_Est_Dans_Le_Buts	PRIMARY KEY (heure_debut, numero_joueur, nomequipe, matchID),
	CONSTRAINT fk_joueur FOREIGN KEY (numero_joueur,nomequipe) REFERENCES Goalie (numero,nomequipe),
	CONSTRAINT fk_matchID FOREIGN KEY (matchID) REFERENCES Match (matchID)
);


