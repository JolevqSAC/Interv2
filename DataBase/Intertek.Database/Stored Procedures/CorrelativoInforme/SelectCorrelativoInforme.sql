IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectCorrelativoInforme]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectCorrelativoInforme]
GO

CREATE PROCEDURE [dbo].[SelectCorrelativoInforme]
(
	@IDINF int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDINF],
	[INF_Numero],
	[INF_Anio]
	FROM [CorrelativoInforme]
	WHERE [IDINF] = @IDINF

	SET NOCOUNT OFF
END

GO
