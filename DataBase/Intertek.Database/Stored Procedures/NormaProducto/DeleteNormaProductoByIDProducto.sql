IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteNormaProductoByIDProducto]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteNormaProductoByIDProducto]
GO

CREATE PROCEDURE [dbo].[DeleteNormaProductoByIDProducto]
(
	@IDProducto int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [NormaProducto]
	WHERE [IDProducto] = @IDProducto

	SET NOCOUNT OFF
END

GO
