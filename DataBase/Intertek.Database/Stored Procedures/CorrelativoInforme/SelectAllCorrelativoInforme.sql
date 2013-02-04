IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllCorrelativoInforme]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllCorrelativoInforme]
GO

CREATE PROCEDURE [dbo].[SelectAllCorrelativoInforme]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDINF],
	[INF_Numero],
	[INF_Anio]
	FROM [CorrelativoInforme]

	SET NOCOUNT OFF
END

GO
