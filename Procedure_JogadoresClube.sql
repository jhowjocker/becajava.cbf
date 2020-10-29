CREATE PROCEDURE SP_Jogadores_Por_Clube
	@ClubeId INT
AS
BEGIN
	SELECT Jogador.Nome, Clube.NomeClube AS NomeClube
FROM Jogador INNER JOIN Clube ON Jogador.ClubeId = Clube.Id WHERE ClubeId = @ClubeId
END


EXEC SP_Jogadores_Por_Clube 1