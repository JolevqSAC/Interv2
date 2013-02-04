IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateItemsPreparacionReactivo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateItemsPreparacionReactivo]
GO

CREATE PROCEDURE [dbo].[UpdateItemsPreparacionReactivo]
(
	@IDitems int,
	@IDReactivo int,
	@IDCompra int,
	@IDPreparacionReactivo int,
	@ITM_Cantidad char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [ItemsPreparacionReactivo]
	SET [IDReactivo] = @IDReactivo, 
		[IDCompra] = @IDCompra, 
		[IDPreparacionReactivo] = @IDPreparacionReactivo, 
		[ITM_Cantidad] = @ITM_Cantidad
	WHERE [IDitems] = @IDitems

	SET NOCOUNT OFF
END

GO
