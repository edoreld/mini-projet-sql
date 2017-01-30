 -- Travail individuel -> 3 requêtes demandées 

-- Requête qui retourne la liste d'équipes qui on joue dans l'année 2001
-- La complexité de la requête est donnée par la jointure

SELECT e.nomequipe FROM equipe AS e
INNER JOIN Joue ON (e.nomequipe = joue.nomequipe) 
INNER JOIN _Match on (_match.matchID = joue.matchID)
WHERE EXTRACT('year' from _match.date_match) = 2001;

-- Requête qui retourne la liste de gardiens qui n'ont pas encaisses aucun but

SELECT nom, prenom FROM Joueur 
INNER JOIN Gardien on (joueur.numero = gardien.numero AND joueur.nomequipe = gardien.nomequipe)
EXCEPT
SELECT nom,prenom FROM Joueur
INNER JOIN Gardien on (joueur.numero = gardien.numero AND joueur.nomequipe = gardien.nomequipe)
INNER JOIN Est_Dans_Le_Buts ON (gardien.numero = Est_Dans_Le_Buts.numero_joueur AND gardien.nomequipe = Est_Dans_Le_Buts.nomequipe)
WHERE nb_buts_encaisses > 0

