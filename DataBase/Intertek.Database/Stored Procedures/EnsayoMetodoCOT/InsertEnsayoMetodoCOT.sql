IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertEnsayoMetodoCOT]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertEnsayoMetodoCOT]
GO

CREATE PROCEDURE [dbo].[InsertEnsayoMetodoCOT]
(
	@IDEnsayoMetodo int OUT,
	@IDEnsayo int,
	@IDMetodo int,
	@IDPersonal int,
	@IDCOT int,
	@ENM_OficialNoOficial char(18),
	@ENM_Cantidad char(18),
	@ENM_Precio char(18),
	@ENM_FechaInicio char(18),
	@ENM_FechaFin char(18),
	@IDCotizacion int,
	@ENM_EsSS char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [EnsayoMetodoCOT] ([IDEnsayo], [IDMetodo], [IDPersonal], [IDCOT], [ENM_OficialNoOficial], [ENM_Cantidad], [ENM_Precio], [ENM_FechaInicio], [ENM_FechaFin], [IDCotizacion], [ENM_EsSS]) 
	VALUES (@IDEnsayo, @IDMetodo, @IDPersonal, @IDCOT, @ENM_OficialNoOficial, @ENM_Cantidad, @ENM_Precio, @ENM_FechaInicio, @ENM_FechaFin, @IDCotizacion, @ENM_EsSS)

	SET @IDEnsayoMetodo = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
