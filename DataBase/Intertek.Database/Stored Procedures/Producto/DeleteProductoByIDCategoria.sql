IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteProductoByIDCategoria]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteProductoByIDCategoria]
GO

CREATE PROCEDURE [dbo].[DeleteProductoByIDCategoria]
(
	@IDCategoria int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Producto]
	WHERE [IDCategoria] = @IDCategoria

	SET NOCOUNT OFF
END

GO
