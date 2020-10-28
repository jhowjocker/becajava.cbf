SELECT Jogador.Nome, Posicao.Descricao
FROM Jogador INNER JOIN Posicao ON Jogador.ClubeId = Posicao.Id
