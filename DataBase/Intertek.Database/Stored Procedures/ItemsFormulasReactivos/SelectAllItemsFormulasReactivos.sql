IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllItemsFormulasReactivos]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllItemsFormulasReactivos]
GO

CREATE PROCEDURE [dbo].[SelectAllItemsFormulasReactivos]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDItems],
	[IDReactivo],
	[IDFormula],
	[ITM_Cantidad]
	FROM [ItemsFormulasReactivos]

	SET NOCOUNT OFF
END

GO
