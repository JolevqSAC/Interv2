IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteCompraReactivos]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteCompraReactivos]
GO

CREATE PROCEDURE [dbo].[DeleteCompraReactivos]
(
	@IDCompra int,
	@IDReactivo int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [CompraReactivos]
	WHERE [IDCompra] = @IDCompra AND [IDReactivo] = @IDReactivo

	SET NOCOUNT OFF
END

GO
