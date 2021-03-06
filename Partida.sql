/*
   quarta-feira, 28 de outubro de 202013:32:20
   Usuário: 
   Servidor: SAO-JDTHC72\SQLEXPRESS
   Banco de Dados: CBF
   Aplicativo: 
*/

/* Para impedir possíveis problemas de perda de dados, analise este script detalhadamente antes de executá-lo fora do contexto do designer de banco de dados.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_Partida
	(
	Id int NOT NULL IDENTITY (1, 1),
	Mandante varchar(50) NULL,
	GolsMandante varchar(50) NULL,
	VisitanteId int NULL,
	GolsVisitante int NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Partida SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_Partida ON
GO
IF EXISTS(SELECT * FROM dbo.Partida)
	 EXEC('INSERT INTO dbo.Tmp_Partida (Id, Mandante, GolsMandante, VisitanteId, GolsVisitante)
		SELECT Id, Mandante, GolsMandante, VisitanteId, GolsVisitante FROM dbo.Partida WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Partida OFF
GO
DROP TABLE dbo.Partida
GO
EXECUTE sp_rename N'dbo.Tmp_Partida', N'Partida', 'OBJECT' 
GO
ALTER TABLE dbo.Partida ADD CONSTRAINT
	PK_Partida PRIMARY KEY CLUSTERED 
	(
	Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
COMMIT
select Has_Perms_By_Name(N'dbo.Partida', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Partida', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Partida', 'Object', 'CONTROL') as Contr_Per 