/*
   quarta-feira, 28 de outubro de 202013:21:08
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
CREATE TABLE dbo.Clube
	(
	Id int NOT NULL,
	NomeClube varchar(50) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Clube ADD CONSTRAINT
	PK_Clube PRIMARY KEY CLUSTERED 
	(
	Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Clube SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Clube', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Clube', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Clube', 'Object', 'CONTROL') as Contr_Per 