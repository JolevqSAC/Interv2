IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteCategoriaProducto]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteCategoriaProducto]
GO

CREATE PROCEDURE [dbo].[DeleteCategoriaProducto]
(
	@IDCategoria int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [CategoriaProducto]
	WHERE [IDCategoria] = @IDCategoria

	SET NOCOUNT OFF
END

GO
