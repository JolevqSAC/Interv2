IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteProducto]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteProducto]
GO

CREATE PROCEDURE [dbo].[DeleteProducto]
(
	@IDProducto int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Producto]
	WHERE [IDProducto] = @IDProducto

	SET NOCOUNT OFF
END

GO
