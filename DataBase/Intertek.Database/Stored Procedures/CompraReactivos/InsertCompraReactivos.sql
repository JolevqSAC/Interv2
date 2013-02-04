IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertCompraReactivos]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertCompraReactivos]
GO

CREATE PROCEDURE [dbo].[InsertCompraReactivos]
(
	@IDCompra int OUT,
	@IDReactivo int,
	@COM_Fecha char(18),
	@COM_CodigoCompra char(18),
	@COM_AvisoTiempo char(18),
	@COM_Cantidad char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [CompraReactivos] ([IDReactivo], [COM_Fecha], [COM_CodigoCompra], [COM_AvisoTiempo], [COM_Cantidad]) 
	VALUES (@IDReactivo, @COM_Fecha, @COM_CodigoCompra, @COM_AvisoTiempo, @COM_Cantidad)

	SET @IDCompra = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
