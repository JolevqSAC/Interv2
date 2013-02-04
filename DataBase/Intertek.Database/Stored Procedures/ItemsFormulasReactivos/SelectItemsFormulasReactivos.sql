IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectItemsFormulasReactivos]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectItemsFormulasReactivos]
GO

CREATE PROCEDURE [dbo].[SelectItemsFormulasReactivos]
(
	@IDItems int
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
	WHERE [IDItems] = @IDItems

	SET NOCOUNT OFF
END

GO
