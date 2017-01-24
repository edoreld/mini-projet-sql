-- Dans ce cas vous ne devez faire que 3 requêtes sur les 6 et un seul déclencheur.

--
--
-- Contexte: Passage au relationnel du mini-projet Bases de données relationnel Licence MIDO 3ème année par alternance

-- Car on ne peut pas identifier un match uniquement par les trois attribus de la classe Match sur le diagramme UML, on ajoute
-- un attribut MatchID qui sera notre clé primaire. 

CREATE TABLE Match 
(
	matchID		SERIAL,
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
-- Goalie == Gardien

CREATE TABLE Goalie
(
	numero 			SMALLINT,
	nomequipe		VARCHAR,
	CONSTRAINT pk_numero PRIMARY KEY (numero,nomequipe),
	CONSTRAINT fk_goalie FOREIGN KEY (numero,nomequipe) REFERENCES Joueur (numero,nomequipe)
);

-- Car relation 1 - * entre But et bb  b Match / Joueur
-- L'attribut heure n'set suffisant pour identifier un but, donc on ajoute un attribute butId qui sera la clé primaire
CREATE TABLE But 
(	
	butID		SERIAL,
	heure 		TIME,
	matchID		INTEGER,
	numero		SMALLINT,
	nomequipe	VARCHAR,
	CONSTRAINT pk_but PRIMARY KEY (butID),
	CONSTRAINT fk_but_matchID FOREIGN KEY (matchID) REFERENCES Match(matchID),
	CONSTRAINT fk_joueur FOREIGN KEY (numero, nomequipe) REFERENCES Joueur (numero, nomequipe)
);

-- Relation (* - *), on créeu ne nouvelle primaire est les clés primaires de rélations à côté seront les clés étrangères
CREATE TABLE Est_Dans_Le_Buts
(
	est_dans_le_butsID	SERIAL,
	heure_debut		TIME,
	heure_fin		TIME,
	nb_buts_encaisses	SMALLINT,
	numero_joueur		SMALLINT,
	nomequipe		VARCHAR,
	matchID 		INTEGER,
	CONSTRAINT pk_Est_Dans_Le_Buts PRIMARY KEY (est_Dans_Le_ButsID),
	CONSTRAINT fk_joueur FOREIGN KEY (numero_joueur,nomequipe) REFERENCES Goalie (numero,nomequipe),
	CONSTRAINT fk_est_dans_le_buts_matchID FOREIGN KEY (matchID) REFERENCES Match (matchID)
);

CREATE TABLE assiste 
(
	butID		INTEGER,
	numero_joueur	SMALLINT,
	nomequipe	VARCHAR,
	CONSTRAINT pk_assiste PRIMARY KEY (butID,numero_joueur,nomequipe),
	CONSTRAINT fk_but FOREIGN KEY (butID) REFERENCES But (butID),
	CONSTRAINT fk_joueur FOREIGN KEY (numero_joueur,nomequipe) REFERENCES Joueur (numero, nomequipe)
);

CREATE TABLE Joue
(
	joueID		SERIAL,
	score		VARCHAR,	
	classement	SMALLINT,
	matchID 	INTEGER,
	nomequipe	VARCHAR,
	CONSTRAINT fk_joue_matchID FOREIGN KEY (matchID) REFERENCES Match (matchID),
	CONSTRAINT fk_equipe FOREIGN KEY (nomequipe) REFERENCES Equipe(nomequipe)
);
