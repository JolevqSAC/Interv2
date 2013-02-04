IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertControlReactivos]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertControlReactivos]
GO

CREATE PROCEDURE [dbo].[InsertControlReactivos]
(
	@IDControl int OUT,
	@IDReactivo int,
	@COR_Cantidad char(18),
	@COR_StockCritico char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [ControlReactivos] ([IDReactivo], [COR_Cantidad], [COR_StockCritico]) 
	VALUES (@IDReactivo, @COR_Cantidad, @COR_StockCritico)

	SET @IDControl = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
