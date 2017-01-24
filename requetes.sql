-- Quel equipe a gagné plus nombre de matchs et le nombre de matchs gagnés dans le dernier mois

-- 2 first lines = select all teams that have won matches with the number of their matches won

CREATE VIEW
SELECT nomequipe, COUNT(Classement) matches_gagnés FROM Joue
WHERE classement = 1 
GROUP BY nomequipe 
HAVING COUNT(Classement) >= (
SELECT MAX(Classement) 
FROM 


