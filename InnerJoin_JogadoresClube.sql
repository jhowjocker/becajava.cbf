SELECT Jogador.Nome, Clube.NomeClube AS NomeClube
FROM Jogador INNER JOIN Clube ON Jogador.ClubeId = Clube.Id
WHERE ClubeId = 3