IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectCompraReactivosByIDReactivo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectCompraReactivosByIDReactivo]
GO

CREATE PROCEDURE [dbo].[SelectCompraReactivosByIDReactivo]
(
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
	WHERE [IDReactivo] = @IDReactivo

	SET NOCOUNT OFF
END

GO
