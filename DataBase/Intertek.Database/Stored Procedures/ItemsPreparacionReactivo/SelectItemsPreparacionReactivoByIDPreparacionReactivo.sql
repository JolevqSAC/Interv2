IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectItemsPreparacionReactivoByIDPreparacionReactivo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectItemsPreparacionReactivoByIDPreparacionReactivo]
GO

CREATE PROCEDURE [dbo].[SelectItemsPreparacionReactivoByIDPreparacionReactivo]
(
	@IDPreparacionReactivo int
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
	WHERE [IDPreparacionReactivo] = @IDPreparacionReactivo

	SET NOCOUNT OFF
END

GO
