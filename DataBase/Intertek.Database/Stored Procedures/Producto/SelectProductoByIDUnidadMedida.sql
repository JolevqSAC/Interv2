IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectProductoByIDUnidadMedida]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectProductoByIDUnidadMedida]
GO

CREATE PROCEDURE [dbo].[SelectProductoByIDUnidadMedida]
(
	@IDUnidadMedida int
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
	WHERE [IDUnidadMedida] = @IDUnidadMedida

	SET NOCOUNT OFF
END

GO
