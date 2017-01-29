-- Quel equipe a gagné plus nombre de matchs et le nombre de matchs gagnés dans le dernier mois

-- 2 first lines = select all teams that have won matches with the number of their matches won


SELECT j.Nom, j.Prenom 
FROM Joueur j
INNER JOIN equipe e1
ON e1.nomequipe = j.nomequipe
WHERE j.nomequipe = 'Eagles'

