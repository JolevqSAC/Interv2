IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteItemsPreparacionReactivoByIDPreparacionReactivo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteItemsPreparacionReactivoByIDPreparacionReactivo]
GO

CREATE PROCEDURE [dbo].[DeleteItemsPreparacionReactivoByIDPreparacionReactivo]
(
	@IDPreparacionReactivo int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [ItemsPreparacionReactivo]
	WHERE [IDPreparacionReactivo] = @IDPreparacionReactivo

	SET NOCOUNT OFF
END

GO
