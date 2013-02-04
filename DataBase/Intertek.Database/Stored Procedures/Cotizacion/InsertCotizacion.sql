IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertCotizacion]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertCotizacion]
GO

CREATE PROCEDURE [dbo].[InsertCotizacion]
(
	@IDCotizacion int OUT,
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

	INSERT INTO [Cotizacion] ([IDCOT], [IDCliente], [IDLugarMuestreo], [IDComentario], [IDProducto], [IDPER], [COT_FechaRecibido], [COT_FechaEntrega], [COT_InstruccionesPago], [COT_InfoAdicional], [COT_Dirimente], [COT_TiempoCustodia], [COT_DestinoMuestra], [COT_Ambientacion], [COT_FechaAprobacion], [COT_Estado]) 
	VALUES (@IDCOT, @IDCliente, @IDLugarMuestreo, @IDComentario, @IDProducto, @IDPER, @COT_FechaRecibido, @COT_FechaEntrega, @COT_InstruccionesPago, @COT_InfoAdicional, @COT_Dirimente, @COT_TiempoCustodia, @COT_DestinoMuestra, @COT_Ambientacion, @COT_FechaAprobacion, @COT_Estado)

	SET @IDCotizacion = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
