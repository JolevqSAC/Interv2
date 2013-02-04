IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectCoordenadasReportes]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectCoordenadasReportes]
GO

CREATE PROCEDURE [dbo].[SelectCoordenadasReportes]
(
	@IDCoordenadasReportes int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDCoordenadasReportes],
	[IDEnsayo],
	[IDMetodo],
	[COR_Celdas],
	[COR_Archivo],
	[COR_Hoja],
	[COR_CeldaFin],
	[COR_EsMB]
	FROM [CoordenadasReportes]
	WHERE [IDCoordenadasReportes] = @IDCoordenadasReportes

	SET NOCOUNT OFF
END

GO
