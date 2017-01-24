-- Equipe
INSERT INTO Equipe VALUES ('Squirrels', 10);
INSERT INTO Equipe VALUES ('Eagles', 10);
INSERT INTO Equipe VALUES ('Gladiators', 10);
INSERT INTO Equipe VALUES ('Procrastinators', 10);
INSERT INTO Equipe VALUES ('Monkeys', 10);

-- Match
INSERT INTO Match (matchID,date_match,heure_debut,heure_fin) VALUES ('2001-10-01', '21:00:00', '22:30:00');
INSERT INTO Match (matchID,date_match,heure_debut,heure_fin) VALUES ('2002-12-12', '20:00:00', '21:30:00');
INSERT INTO Match (matchID,date_match,heure_debut,heure_fin) VALUES ('2003-03-17', '21:00:00', '22:30:00');
INSERT INTO Match (matchID,date_match,heure_debut,heure_fin) VALUES ('2004-01-23', '17:00:00', '18:30:00');
INSERT INTO Match (matchID,date_match,heure_debut,heure_fin) VALUES ('2005-04-07', '21:00:00', '22:30:00');

-- Joueur

INSERT INTO Joueur VALUES (1, 'Eagles', 'Manouvrier', 'Maude', '23-08-1987');
INSERT INTO Joueur VALUES (1, 'Gladiators', 'Maude ', 'Martinez', '20-08-1984');
INSERT INTO Joueur VALUES (3, 'Eagles', 'Ildra', 'Jimenez', '12-08-1985');
INSERT INTO Joueur VALUES (2, 'Squirrels', 'Paco', 'Garcia', '02-08-1983');
INSERT INTO Joueur VALUES (3, 'Monkeys', 'Jean', 'Le Fleur', '12-08-1980');
INSERT INTO Joueur VALUES (2, 'Procrastinators', 'Lynda', 'Martinez', '13-08-1980');
INSERT INTO Joueur VALUES (5, 'Gladiators', 'Clarence', 'Fernandez', '17-08-1982');
INSERT INTO Joueur VALUES (6, 'Gladiators', 'Emilie', 'Colbert', '24-08-1983');
INSERT INTO Joueur VALUES (1, 'Procrastinators', 'Donald', 'Trump', '22-08-1996');
INSERT INTO Joueur VALUES (9, 'Eagles', 'Barack', 'Obama', '22-08-1996');

-- Goalie = Gardien

INSERT INTO Goalie VALUES (1, 'Eagles');
INSERT INTO Goalie VALUES (1, 'Procrastinators');
INSERT INTO Goalie VALUES (1, 'Gladiators');

-- But
-- Consider adding a time constraint for the buts

INSERT INTO But (heure,matchID,numero,nomequipe) VALUES ('21:00:01', 1, 1, 'Eagles');
INSERT INTO But (heure,matchID,numero,nomequipe) VALUES ('21:15:01', 2, 3, 'Eagles');
INSERT INTO But (heure,matchID,numero,nomequipe) VALUES ('21:15:01', 3, 1, 'Procrastinators');
INSERT INTO But (heure,matchID,numero,nomequipe) VALUES ('17:23:01', 4, 6, 'Gladiators');
INSERT INTO But (heure,matchID,numero,nomequipe) VALUES ('21:15:01', 5, 3, 'Monkeys');

-- Joue

INSERT INTO Joue (score, classement, matchID, nomequipe) VALUES (4,1,1,'Eagles');
INSERT INTO Joue (score, classement, matchID, nomequipe) VALUES (3,2,1,'Squirrels');

-- Est_dans_Le_Buts

INSERT INTO Est_Dans_Le_Buts (heure_debut, heure_fin, nb_buts_encaisses, numero_joueur, nomequipe, matchID) VALUES ('21:00:00', '22:30:00', 3, 1, 'Eagles', 1);

-- Assiste

INSERT INTO assiste VALUES (1, 3,'Eagles') 


