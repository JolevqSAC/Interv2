IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectControlReactivos]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectControlReactivos]
GO

CREATE PROCEDURE [dbo].[SelectControlReactivos]
(
	@IDControl int,
	@IDReactivo int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDControl],
	[IDReactivo],
	[COR_Cantidad],
	[COR_StockCritico]
	FROM [ControlReactivos]
	WHERE [IDControl] = @IDControl AND [IDReactivo] = @IDReactivo

	SET NOCOUNT OFF
END

GO
