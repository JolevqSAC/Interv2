IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllControlReactivos]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllControlReactivos]
GO

CREATE PROCEDURE [dbo].[SelectAllControlReactivos]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDControl],
	[IDReactivo],
	[COR_Cantidad],
	[COR_StockCritico]
	FROM [ControlReactivos]

	SET NOCOUNT OFF
END

GO
