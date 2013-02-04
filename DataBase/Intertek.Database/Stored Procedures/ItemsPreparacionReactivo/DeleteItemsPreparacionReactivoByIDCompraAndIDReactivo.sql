IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteItemsPreparacionReactivoByIDCompraAndIDReactivo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteItemsPreparacionReactivoByIDCompraAndIDReactivo]
GO

CREATE PROCEDURE [dbo].[DeleteItemsPreparacionReactivoByIDCompraAndIDReactivo]
(
	@IDCompra int,
	@IDReactivo int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [ItemsPreparacionReactivo]
	WHERE [IDCompra] = @IDCompra AND [IDReactivo] = @IDReactivo

	SET NOCOUNT OFF
END

GO
