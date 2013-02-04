IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectItemsPreparacionReactivoByIDReactivo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectItemsPreparacionReactivoByIDReactivo]
GO

CREATE PROCEDURE [dbo].[SelectItemsPreparacionReactivoByIDReactivo]
(
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
	WHERE [IDReactivo] = @IDReactivo

	SET NOCOUNT OFF
END

GO
