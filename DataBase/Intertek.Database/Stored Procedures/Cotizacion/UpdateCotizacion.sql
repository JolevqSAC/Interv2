IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateCotizacion]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateCotizacion]
GO

CREATE PROCEDURE [dbo].[UpdateCotizacion]
(
	@IDCotizacion int,
	@IDCOT int,
	@IDCliente int,
	@IDLugarMuestreo int,
	@IDComentario int,
	@IDProducto int,
	@IDPER int,
	@COT_FechaRecibido char(18),
	@COT_FechaEntrega char(18),
	@COT_InstruccionesPago char(18),
	@COT_InfoAdicional char(18),
	@COT_Dirimente char(18),
	@COT_TiempoCustodia char(18),
	@COT_DestinoMuestra char(18),
	@COT_Ambientacion char(18),
	@COT_FechaAprobacion char(18),
	@COT_Estado char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [Cotizacion]
	SET [IDCliente] = @IDCliente, 
		[IDLugarMuestreo] = @IDLugarMuestreo, 
		[IDComentario] = @IDComentario, 
		[IDProducto] = @IDProducto, 
		[IDPER] = @IDPER, 
		[COT_FechaRecibido] = @COT_FechaRecibido, 
		[COT_FechaEntrega] = @COT_FechaEntrega, 
		[COT_InstruccionesPago] = @COT_InstruccionesPago, 
		[COT_InfoAdicional] = @COT_InfoAdicional, 
		[COT_Dirimente] = @COT_Dirimente, 
		[COT_TiempoCustodia] = @COT_TiempoCustodia, 
		[COT_DestinoMuestra] = @COT_DestinoMuestra, 
		[COT_Ambientacion] = @COT_Ambientacion, 
		[COT_FechaAprobacion] = @COT_FechaAprobacion, 
		[COT_Estado] = @COT_Estado
	WHERE [IDCotizacion] = @IDCotizacion AND [IDCOT] = @IDCOT

	SET NOCOUNT OFF
END

GO
