IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertCoordenadasReportes]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertCoordenadasReportes]
GO

CREATE PROCEDURE [dbo].[InsertCoordenadasReportes]
(
	@IDCoordenadasReportes int OUT,
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

	INSERT INTO [CoordenadasReportes] ([IDEnsayo], [IDMetodo], [COR_Celdas], [COR_Archivo], [COR_Hoja], [COR_CeldaFin], [COR_EsMB]) 
	VALUES (@IDEnsayo, @IDMetodo, @COR_Celdas, @COR_Archivo, @COR_Hoja, @COR_CeldaFin, @COR_EsMB)

	SET @IDCoordenadasReportes = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
