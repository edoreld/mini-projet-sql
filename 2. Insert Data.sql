SET datestyle = "ISO, DMY";

-- Equipe
INSERT INTO Equipe VALUES ('Squirrels', 10);
INSERT INTO Equipe VALUES ('Eagles', 10);
INSERT INTO Equipe VALUES ('Gladiators', 10);
INSERT INTO Equipe VALUES ('Procrastinators', 10);
INSERT INTO Equipe VALUES ('Monkeys', 10);

-- _Match
INSERT INTO _Match (matchID,date_match,heure_debut,heure_fin) VALUES (1,'02-02-2001', '21:00:00', '22:30:00');
INSERT INTO _Match (matchID,date_match,heure_debut,heure_fin) VALUES (2,'06-03-2002', '20:00:00', '21:30:00');
INSERT INTO _Match (matchID,date_match,heure_debut,heure_fin) VALUES (3,'05-04-2003', '21:00:00', '22:30:00');
INSERT INTO _Match (matchID,date_match,heure_debut,heure_fin) VALUES (4,'13-05-2004', '17:00:00', '18:30:00');
INSERT INTO _Match (matchID,date_match,heure_debut,heure_fin) VALUES (5,'12-06-2005', '21:00:00', '22:30:00');

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
INSERT INTO Joueur VALUES (1, 'Squirrels', 'May', 'Zoera', '18-08-1983');
INSERT INTO Joueur VALUES (1, 'Monkeys', 'Hyrule', 'Link', '19-02-1988');

-- Gardien

INSERT INTO Gardien VALUES (1, 'Eagles');
INSERT INTO Gardien VALUES (1, 'Procrastinators');
INSERT INTO Gardien VALUES (1, 'Gladiators');
INSERT INTO Gardien VALUES (1, 'Squirrels');
INSERT INTO Gardien VALUES (1, 'Monkeys');

-- But
-- Consider adding a time constraint for the buts

INSERT INTO But (butID,heure,matchID,numero,nomequipe) VALUES (1,'21:00:01', 1, 1, 'Eagles');
INSERT INTO But (butID,heure,matchID,numero,nomequipe) VALUES (2,'21:15:01', 2, 3, 'Eagles');
INSERT INTO But (butID,heure,matchID,numero,nomequipe) VALUES (3,'21:15:01', 3, 1, 'Procrastinators');
INSERT INTO But (butID,heure,matchID,numero,nomequipe) VALUES (4,'17:23:01', 4, 6, 'Gladiators');
INSERT INTO But (butID,heure,matchID,numero,nomequipe) VALUES (5,'21:15:01', 5, 3, 'Monkeys');

-- Joue

INSERT INTO Joue (score, classement, matchID, nomequipe) VALUES (4,1,1,'Eagles');
INSERT INTO Joue (score, classement, matchID, nomequipe) VALUES (3,2,1,'Squirrels');

-- Est_dans_Le_Buts

INSERT INTO Est_Dans_Le_Buts VALUES ('21:00:00', '22:30:00', 3, 1, 'Eagles', 1);
INSERT INTO Est_Dans_Le_Buts VALUES ('22:00:00', '23:00:00', 4, 1, 'Gladiators', 1);
INSERT INTO Est_Dans_Le_Buts VALUES ('22:00:00', '23:00:00', 4, 1, 'Squirrels', 1);
INSERT INTO Est_Dans_Le_Buts VALUES ('22:00:00', '23:00:00', 4, 1, 'Procrastinators', 1);

-- Assiste

INSERT INTO assiste VALUES (1, 3,'Eagles');

-- Joue

INSERT INTO JOUE VALUES (1, 2, 1, 'Eagles');
INSERT INTO JOUE VALUES (1, 2, 2, 'Squirrels');