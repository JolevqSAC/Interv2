IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectCorrelativoSI]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectCorrelativoSI]
GO

CREATE PROCEDURE [dbo].[SelectCorrelativoSI]
(
	@IDSI int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDSI],
	[SI_Numero],
	[SI_Anio]
	FROM [CorrelativoSI]
	WHERE [IDSI] = @IDSI

	SET NOCOUNT OFF
END

GO
