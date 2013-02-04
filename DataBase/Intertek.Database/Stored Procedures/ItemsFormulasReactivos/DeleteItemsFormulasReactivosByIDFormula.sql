IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteItemsFormulasReactivosByIDFormula]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteItemsFormulasReactivosByIDFormula]
GO

CREATE PROCEDURE [dbo].[DeleteItemsFormulasReactivosByIDFormula]
(
	@IDFormula int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [ItemsFormulasReactivos]
	WHERE [IDFormula] = @IDFormula

	SET NOCOUNT OFF
END

GO
