IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteItemsFormulasReactivosByIDReactivo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteItemsFormulasReactivosByIDReactivo]
GO

CREATE PROCEDURE [dbo].[DeleteItemsFormulasReactivosByIDReactivo]
(
	@IDReactivo int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [ItemsFormulasReactivos]
	WHERE [IDReactivo] = @IDReactivo

	SET NOCOUNT OFF
END

GO
