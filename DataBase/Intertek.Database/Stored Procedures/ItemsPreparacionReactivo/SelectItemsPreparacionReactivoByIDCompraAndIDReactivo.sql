IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectItemsPreparacionReactivoByIDCompraAndIDReactivo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectItemsPreparacionReactivoByIDCompraAndIDReactivo]
GO

CREATE PROCEDURE [dbo].[SelectItemsPreparacionReactivoByIDCompraAndIDReactivo]
(
	@IDCompra int,
	@IDReactivo int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDitems],
	[IDReactivo],
	[IDCompra],
	[IDPreparacionReactivo],
	[ITM_Cantidad]
	FROM [ItemsPreparacionReactivo]
	WHERE [IDCompra] = @IDCompra AND [IDReactivo] = @IDReactivo

	SET NOCOUNT OFF
END

GO
