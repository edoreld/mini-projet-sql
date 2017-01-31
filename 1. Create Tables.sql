-- Dans ce cas vous ne devez faire que 3 requêtes sur les 6 et un seul déclencheur.

--
--
-- Contexte: Passage au relationnel du mini-projet Bases de données relationnel Licence MIDO 3ème année par alternance

-- Car on ne peut pas identifier un match uniquement par les trois attribus de la classe Match sur le diagramme UML, on ajoute
-- un attribut matchID qui sera notre clé primaire. 

CREATE TABLE _Match 
(
	matchID		SERIAL,
	date_match	DATE,
	heure_debut	TIME,
	heure_fin	TIME CONSTRAINT chk_heure_fin CHECK (heure_debut IS NOT NULL AND date_match IS NOT NULL),
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

-- Car Gardien a les mêmes attributes que Joueur, plutôt que dupliquer des attributs, 
-- on peut faire référence à Joueur dans la rélation Gardien par la clé primaire (numero, nomequipe). 

CREATE TABLE Gardien
(
	numero 			SMALLINT,
	nomequipe		VARCHAR,
	CONSTRAINT pk_numero PRIMARY KEY (numero,nomequipe),
	CONSTRAINT fk_Gardien FOREIGN KEY (numero,nomequipe) REFERENCES Joueur (numero,nomequipe)
);

-- Car relation 1 - * entre But et bb  b Match / Joueur
-- L'attribut heure n'set suffisant pour identifier un but, donc on ajoute 
-- un attribute butId qui sera la clé primaire
CREATE TABLE But 
(	
	butID		SERIAL,
	heure 		TIME,
	matchID		INTEGER,
	numero		SMALLINT,
	nomequipe	VARCHAR,
	CONSTRAINT pk_but PRIMARY KEY (butID),
	CONSTRAINT fk_but_matchID FOREIGN KEY (matchID) REFERENCES _Match(matchID),
	CONSTRAINT fk_joueur FOREIGN KEY (numero, nomequipe) REFERENCES Joueur (numero, nomequipe)
);

 -- Assiste

CREATE TABLE assiste 
(
	butID		INTEGER,
	numero_joueur	SMALLINT,
	nomequipe	VARCHAR,
	CONSTRAINT pk_assiste PRIMARY KEY (butID,numero_joueur,nomequipe),
	CONSTRAINT fk_but FOREIGN KEY (butID) REFERENCES But (butID),
	CONSTRAINT fk_joueur FOREIGN KEY (numero_joueur,nomequipe) REFERENCES Joueur (numero, nomequipe)
);

-- Relation (* - *), on créeu ne nouvelle primaire est les clés primaires de rélations 
-- à côté seront les clés étrangères
CREATE TABLE Est_Dans_Le_Buts
(
	heure_debut		TIME,
	heure_fin		TIME,
	nb_buts_encaisses	SMALLINT,
	numero_joueur		SMALLINT,
	nomequipe		VARCHAR,
	matchID 		INTEGER,
	CONSTRAINT pk_Est_Dans_Le_Buts PRIMARY KEY (matchID,numero_joueur,nomequipe),
	CONSTRAINT fk_est_dans_le_buts_matchID FOREIGN KEY (matchID) REFERENCES _Match (matchID),
	CONSTRAINT fk_joueur FOREIGN KEY (numero_joueur,nomequipe) REFERENCES Gardien (numero,nomequipe)
);

CREATE TABLE Joue
(
	matchID 	INTEGER,
	score		SMALLINT,	
	classement	SMALLINT,
	nomequipe	VARCHAR,
	CONSTRAINT pk_joue PRIMARY KEY (matchID, nomequipe),
	CONSTRAINT fk_joue_matchID FOREIGN KEY (matchID) REFERENCES _Match (matchID),
	CONSTRAINT fk_equipe FOREIGN KEY (nomequipe) REFERENCES Equipe(nomequipe)
);

-- Fonction qui empêche la création d'un nuplet dans la relation Joue 
-- si ça associerait un match à plus de deux équipes.

CREATE OR REPLACE FUNCTION un_match_deux_equipes_coherence() 
RETURNS trigger AS
$BODY$
DECLARE
	counter int;
BEGIN
	SELECT COUNT(*) INTO counter
	FROM Joue
	WHERE matchID = NEW.matchID;
	IF counter > 2 THEN
		RAISE EXCEPTION 'No more than 2 teams per match allowed';
		ABORT TRANSACTION;
	END IF;
	RETURN NEW;
END;
$BODY$ LANGUAGE 'plpgsql';

CREATE TRIGGER un_match_deux_equipes_coherence 
AFTER INSERT ON Joue
FOR EACH ROW 
EXECUTE PROCEDURE un_match_deux_equipes_coherence();

-- Fonction qui empêche la création d'un nuplet dans la relation est_dans_le_buts 
-- si ça associerait un match et un equipe à plus de trois gardiens

CREATE OR REPLACE FUNCTION un_match_un_equipe_trois_gardiens_coherence() 
RETURNS trigger AS
$BODY$
DECLARE
	counter int;
BEGIN
	SELECT COUNT(*) INTO counter
	FROM Est_Dans_Le_Buts
	WHERE matchID = NEW.matchID
	AND nomequipe = NEW.nomequipe;
	IF counter > 3 THEN
		RAISE EXCEPTION 'No more than 3 gardiens of the same team per match allowed';
		ABORT TRANSACTION;
	END IF;
	RETURN NEW;
END;
$BODY$ LANGUAGE 'plpgsql';

CREATE TRIGGER un_match_un_equipe_trois_gardiens_coherence 
AFTER INSERT ON Est_Dans_Le_Buts
FOR EACH ROW 
EXECUTE PROCEDURE un_match_un_equipe_trois_gardiens_coherence();


CREATE OR REPLACE FUNCTION calcul_score_equipe()
RETURNS TRIGGER AS 
$BODY$
BEGIN
	UPDATE Joue SET score = score + 1 
	WHERE matchID = NEW.matchID
	AND joue.nomequipe = NEW.nomequipe;
	RETURN NEW;
END;
$BODY$ LANGUAGE 'plpgsql';


CREATE TRIGGER calcul_score_equipe
AFTER INSERT ON But
FOR EACH ROW 
EXECUTE PROCEDURE calcul_score_equipe();