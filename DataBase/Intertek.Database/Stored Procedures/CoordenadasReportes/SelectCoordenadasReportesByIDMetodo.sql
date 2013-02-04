IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectCoordenadasReportesByIDMetodo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectCoordenadasReportesByIDMetodo]
GO

CREATE PROCEDURE [dbo].[SelectCoordenadasReportesByIDMetodo]
(
	@IDMetodo int
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
	WHERE [IDMetodo] = @IDMetodo

	SET NOCOUNT OFF
END

GO
