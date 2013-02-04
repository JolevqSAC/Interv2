IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllCoordenadasReportes]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllCoordenadasReportes]
GO

CREATE PROCEDURE [dbo].[SelectAllCoordenadasReportes]

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

	SET NOCOUNT OFF
END

GO
