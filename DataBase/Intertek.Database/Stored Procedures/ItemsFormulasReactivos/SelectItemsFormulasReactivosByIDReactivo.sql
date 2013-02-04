IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectItemsFormulasReactivosByIDReactivo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectItemsFormulasReactivosByIDReactivo]
GO

CREATE PROCEDURE [dbo].[SelectItemsFormulasReactivosByIDReactivo]
(
	@IDReactivo int
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
	WHERE [IDReactivo] = @IDReactivo

	SET NOCOUNT OFF
END

GO
