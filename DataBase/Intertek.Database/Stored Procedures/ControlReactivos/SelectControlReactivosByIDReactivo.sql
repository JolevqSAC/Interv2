IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectControlReactivosByIDReactivo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectControlReactivosByIDReactivo]
GO

CREATE PROCEDURE [dbo].[SelectControlReactivosByIDReactivo]
(
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
	WHERE [IDReactivo] = @IDReactivo

	SET NOCOUNT OFF
END

GO
