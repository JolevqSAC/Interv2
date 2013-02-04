IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectProductoByIDCategoria]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectProductoByIDCategoria]
GO

CREATE PROCEDURE [dbo].[SelectProductoByIDCategoria]
(
	@IDCategoria int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDProducto],
	[IDUnidadMedida],
	[PRO_Codigo],
	[PRO_Nombre],
	[PRO_NombreIngles],
	[PRO_Descripcion],
	[PRO_Estado],
	[PRO_UsuarioCreacion],
	[PRO_FechaHoraCreacion],
	[PRO_UsuarioModificacion],
	[PRO_FechaHoraModificacion],
	[IDCategoria]
	FROM [Producto]
	WHERE [IDCategoria] = @IDCategoria

	SET NOCOUNT OFF
END

GO
