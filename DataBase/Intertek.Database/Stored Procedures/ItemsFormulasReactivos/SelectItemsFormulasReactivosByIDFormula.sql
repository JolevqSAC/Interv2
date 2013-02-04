IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectItemsFormulasReactivosByIDFormula]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectItemsFormulasReactivosByIDFormula]
GO

CREATE PROCEDURE [dbo].[SelectItemsFormulasReactivosByIDFormula]
(
	@IDFormula int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDItems],
	[IDReactivo],
	[IDFormula],
	[ITM_Cantidad]
	FROM [ItemsFormulasReactivos]
	WHERE [IDFormula] = @IDFormula

	SET NOCOUNT OFF
END

GO
