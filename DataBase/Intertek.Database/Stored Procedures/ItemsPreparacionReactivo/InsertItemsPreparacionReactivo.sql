IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertItemsPreparacionReactivo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertItemsPreparacionReactivo]
GO

CREATE PROCEDURE [dbo].[InsertItemsPreparacionReactivo]
(
	@IDitems int OUT,
	@IDReactivo int,
	@IDCompra int,
	@IDPreparacionReactivo int,
	@ITM_Cantidad char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [ItemsPreparacionReactivo] ([IDReactivo], [IDCompra], [IDPreparacionReactivo], [ITM_Cantidad]) 
	VALUES (@IDReactivo, @IDCompra, @IDPreparacionReactivo, @ITM_Cantidad)

	SET @IDitems = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
