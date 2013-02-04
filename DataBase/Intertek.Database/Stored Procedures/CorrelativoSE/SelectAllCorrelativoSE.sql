IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllCorrelativoSE]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllCorrelativoSE]
GO

CREATE PROCEDURE [dbo].[SelectAllCorrelativoSE]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDSE],
	[CSE_Numero],
	[CSE_Anio]
	FROM [CorrelativoSE]

	SET NOCOUNT OFF
END

GO
