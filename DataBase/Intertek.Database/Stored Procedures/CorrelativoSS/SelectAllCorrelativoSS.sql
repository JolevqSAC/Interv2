IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllCorrelativoSS]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllCorrelativoSS]
GO

CREATE PROCEDURE [dbo].[SelectAllCorrelativoSS]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDSS],
	[SS_Numero],
	[SS_Anio]
	FROM [CorrelativoSS]

	SET NOCOUNT OFF
END

GO
