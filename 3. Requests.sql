 -- Travail individuel -> 3 requêtes demandées 

-- Requête JOINTURE
-- Requête qui retourne la liste d'équipes qui on joue dans l'année 2001
-- La complexité de la requête est donnée par la jointure

SELECT e.nomequipe FROM equipe AS e
INNER JOIN Joue ON (e.nomequipe = joue.nomequipe) 
INNER JOIN _Match on (_match.matchID = joue.matchID)
WHERE EXTRACT('year' from _match.date_match) = 2001;


-- Première requête avec EXCEPT (MINUS) et JOINTURE
-- @Quoi: Requête qui retourne la liste de gardiens qui n'ont pas encaisses aucun but.
-- @Notes: On aurait put faire cette requête sans l'EXCEPT, donc j'ai fait une requête
-- additionnelle après avec EXCEPT.

SELECT nom, prenom FROM Joueur 
INNER JOIN Gardien on (joueur.numero = gardien.numero AND joueur.nomequipe = gardien.nomequipe)
EXCEPT
SELECT nom,prenom FROM Joueur
INNER JOIN Gardien on (joueur.numero = gardien.numero AND joueur.nomequipe = gardien.nomequipe)
INNER JOIN Est_Dans_Le_Buts ON (gardien.numero = Est_Dans_Le_Buts.numero_joueur AND gardien.nomequipe = Est_Dans_Le_Buts.nomequipe)
WHERE nb_buts_encaisses > 0

-- 2ème Requête avec EXCEPT (MINUS) et JOINTURE
-- @Quoi: requête qui retourne la liste de joueurs qui ne sont pas gardiens

SELECT nom, prenom FROM Joueur
EXCEPT 
SELECT nom, prenom FROM Joueur
INNER JOIN Gardien ON (joueur.numero = gardien.numero AND joueur.nomequipe = gardien.nomequipe)

-- Requête avec GROUP BY
-- @Quoi: requête qui donne la liste d'équipes avec le total de buts marqués par l'équipe dans
-- tous les matchs joués 

SELECT e.nomequipe, SUM(score) FROM equipe AS e, joue AS j
WHERE e.nomequipe = j.nomequipe
GROUP BY e.nomequipe

