IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllItemsPreparacionReactivo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllItemsPreparacionReactivo]
GO

CREATE PROCEDURE [dbo].[SelectAllItemsPreparacionReactivo]

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

	SET NOCOUNT OFF
END

GO
