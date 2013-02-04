IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateItemsFormulasReactivos]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateItemsFormulasReactivos]
GO

CREATE PROCEDURE [dbo].[UpdateItemsFormulasReactivos]
(
	@IDItems int,
	@IDReactivo int,
	@IDFormula int,
	@ITM_Cantidad char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [ItemsFormulasReactivos]
	SET [IDReactivo] = @IDReactivo, 
		[IDFormula] = @IDFormula, 
		[ITM_Cantidad] = @ITM_Cantidad
	WHERE [IDItems] = @IDItems

	SET NOCOUNT OFF
END

GO
