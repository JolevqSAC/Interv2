IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectCompraReactivos]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectCompraReactivos]
GO

CREATE PROCEDURE [dbo].[SelectCompraReactivos]
(
	@IDCompra int,
	@IDReactivo int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDCompra],
	[IDReactivo],
	[COM_Fecha],
	[COM_CodigoCompra],
	[COM_AvisoTiempo],
	[COM_Cantidad]
	FROM [CompraReactivos]
	WHERE [IDCompra] = @IDCompra AND [IDReactivo] = @IDReactivo

	SET NOCOUNT OFF
END

GO
