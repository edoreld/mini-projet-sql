#####
#
# Contexte: Passage au relationnel du mini-projet Bases de données relationnel Licence MIDO 3ème année par alternance

# Car on ne peut pas identifier une rélation uniquement par les trois attribus de la classe Match sur le diagramme UML, on ajoute
# un attribut MatchID qui sera notre clé primaire. 

CREATE TABLE Match 
(
	MatchID		serial UNIQUE,
	date_match	date
	heure_debut	time,
	heure_fin	time,
	CONSTRAINT 	pk_matchid PRIMARY KEY MatchID
)

# La table Equipe avec les attributs initiales et la clé primaire 'nom' identifiant un equipe

CREATE TABLE Equipe 
(
	nom VARCHAR,
	numJoueurs SMALLINT,
	CONSTRAINT pk_nom PRIMARY KEY nom
)

# How to deal with inheritance ?
#  - http://stackoverflow.com/questions/3579079/how-can-you-represent-inheritance-in-a-database
#  
CREATE TABLE Joeur 
(
	numero 			SMALLINT,
	nom 			VARCHAR,
	prenom			VARCHAR,
	datenaissance	date
)

# La table but
CREATE TABLE But 
(
	heure 			time,
	match_id		integer,
	numero_joueur	
)





