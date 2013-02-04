IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateCoordenadasReportes]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateCoordenadasReportes]
GO

CREATE PROCEDURE [dbo].[UpdateCoordenadasReportes]
(
	@IDCoordenadasReportes int,
	@IDEnsayo int,
	@IDMetodo int,
	@COR_Celdas char(18),
	@COR_Archivo char(18),
	@COR_Hoja char(18),
	@COR_CeldaFin char(18),
	@COR_EsMB char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [CoordenadasReportes]
	SET [IDEnsayo] = @IDEnsayo, 
		[IDMetodo] = @IDMetodo, 
		[COR_Celdas] = @COR_Celdas, 
		[COR_Archivo] = @COR_Archivo, 
		[COR_Hoja] = @COR_Hoja, 
		[COR_CeldaFin] = @COR_CeldaFin, 
		[COR_EsMB] = @COR_EsMB
	WHERE [IDCoordenadasReportes] = @IDCoordenadasReportes

	SET NOCOUNT OFF
END

GO
