IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteItemsPreparacionReactivo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteItemsPreparacionReactivo]
GO

CREATE PROCEDURE [dbo].[DeleteItemsPreparacionReactivo]
(
	@IDitems int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [ItemsPreparacionReactivo]
	WHERE [IDitems] = @IDitems

	SET NOCOUNT OFF
END

GO
