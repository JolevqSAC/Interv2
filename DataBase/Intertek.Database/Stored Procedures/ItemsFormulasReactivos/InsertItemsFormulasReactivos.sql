IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertItemsFormulasReactivos]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertItemsFormulasReactivos]
GO

CREATE PROCEDURE [dbo].[InsertItemsFormulasReactivos]
(
	@IDItems int OUT,
	@IDReactivo int,
	@IDFormula int,
	@ITM_Cantidad char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [ItemsFormulasReactivos] ([IDReactivo], [IDFormula], [ITM_Cantidad]) 
	VALUES (@IDReactivo, @IDFormula, @ITM_Cantidad)

	SET @IDItems = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
