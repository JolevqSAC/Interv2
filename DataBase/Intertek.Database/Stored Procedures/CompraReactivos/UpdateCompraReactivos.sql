IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateCompraReactivos]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateCompraReactivos]
GO

CREATE PROCEDURE [dbo].[UpdateCompraReactivos]
(
	@IDCompra int,
	@IDReactivo int,
	@COM_Fecha char(18),
	@COM_CodigoCompra char(18),
	@COM_AvisoTiempo char(18),
	@COM_Cantidad char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [CompraReactivos]
	SET [COM_Fecha] = @COM_Fecha, 
		[COM_CodigoCompra] = @COM_CodigoCompra, 
		[COM_AvisoTiempo] = @COM_AvisoTiempo, 
		[COM_Cantidad] = @COM_Cantidad
	WHERE [IDCompra] = @IDCompra AND [IDReactivo] = @IDReactivo

	SET NOCOUNT OFF
END

GO
