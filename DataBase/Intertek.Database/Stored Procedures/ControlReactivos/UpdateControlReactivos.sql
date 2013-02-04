IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateControlReactivos]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateControlReactivos]
GO

CREATE PROCEDURE [dbo].[UpdateControlReactivos]
(
	@IDControl int,
	@IDReactivo int,
	@COR_Cantidad char(18),
	@COR_StockCritico char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [ControlReactivos]
	SET [COR_Cantidad] = @COR_Cantidad, 
		[COR_StockCritico] = @COR_StockCritico
	WHERE [IDControl] = @IDControl AND [IDReactivo] = @IDReactivo

	SET NOCOUNT OFF
END

GO
