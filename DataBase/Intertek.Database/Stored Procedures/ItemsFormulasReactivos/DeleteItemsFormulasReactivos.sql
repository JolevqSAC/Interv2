IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteItemsFormulasReactivos]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteItemsFormulasReactivos]
GO

CREATE PROCEDURE [dbo].[DeleteItemsFormulasReactivos]
(
	@IDItems int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [ItemsFormulasReactivos]
	WHERE [IDItems] = @IDItems

	SET NOCOUNT OFF
END

GO
