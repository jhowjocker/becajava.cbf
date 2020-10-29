CREATE PROCEDURE SP_Posicoes_Por_Jogadores
AS
BEGIN
	SELECT Jogador.Nome, Posicao.Descricao
FROM Jogador INNER JOIN Posicao ON Jogador.ClubeId = Posicao.Id
END


EXEC SP_Posicoes_Por_Jogadores