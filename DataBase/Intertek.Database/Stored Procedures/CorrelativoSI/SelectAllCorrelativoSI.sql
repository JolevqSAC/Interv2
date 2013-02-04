IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllCorrelativoSI]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllCorrelativoSI]
GO

CREATE PROCEDURE [dbo].[SelectAllCorrelativoSI]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDSI],
	[SI_Numero],
	[SI_Anio]
	FROM [CorrelativoSI]

	SET NOCOUNT OFF
END

GO
