CREATE VIEW VW_Placar
AS
	SELECT 
    Mandante.NomeClube AS ClubeCasa,
    Partida.GolsMandante,
    Partida.GolsVisitante,
    Visitante.NomeClube AS ClubeVisitante
FROM Partida
    INNER JOIN Clube Visitante ON Visitante.Id = Partida.VisitanteId
    INNER JOIN Clube Mandante ON Mandante.Id = Partida.MandanteId


	SELECT * FROM VW_Placar