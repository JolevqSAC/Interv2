IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateEnsayoMetodoCOT]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateEnsayoMetodoCOT]
GO

CREATE PROCEDURE [dbo].[UpdateEnsayoMetodoCOT]
(
	@IDEnsayoMetodo int,
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

	UPDATE [EnsayoMetodoCOT]
	SET [IDEnsayo] = @IDEnsayo, 
		[IDMetodo] = @IDMetodo, 
		[IDPersonal] = @IDPersonal, 
		[IDCOT] = @IDCOT, 
		[ENM_OficialNoOficial] = @ENM_OficialNoOficial, 
		[ENM_Cantidad] = @ENM_Cantidad, 
		[ENM_Precio] = @ENM_Precio, 
		[ENM_FechaInicio] = @ENM_FechaInicio, 
		[ENM_FechaFin] = @ENM_FechaFin, 
		[IDCotizacion] = @IDCotizacion, 
		[ENM_EsSS] = @ENM_EsSS
	WHERE [IDEnsayoMetodo] = @IDEnsayoMetodo

	SET NOCOUNT OFF
END

GO
