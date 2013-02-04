IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteItemsPreparacionReactivoByIDReactivo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteItemsPreparacionReactivoByIDReactivo]
GO

CREATE PROCEDURE [dbo].[DeleteItemsPreparacionReactivoByIDReactivo]
(
	@IDReactivo int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [ItemsPreparacionReactivo]
	WHERE [IDReactivo] = @IDReactivo

	SET NOCOUNT OFF
END

GO
