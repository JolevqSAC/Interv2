IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectCoordenadasReportesByIDEnsayo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectCoordenadasReportesByIDEnsayo]
GO

CREATE PROCEDURE [dbo].[SelectCoordenadasReportesByIDEnsayo]
(
	@IDEnsayo int
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
	WHERE [IDEnsayo] = @IDEnsayo

	SET NOCOUNT OFF
END

GO
