IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectItemsPreparacionReactivo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectItemsPreparacionReactivo]
GO

CREATE PROCEDURE [dbo].[SelectItemsPreparacionReactivo]
(
	@IDitems int
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
	WHERE [IDitems] = @IDitems

	SET NOCOUNT OFF
END

GO
