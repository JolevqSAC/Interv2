IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectProducto]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectProducto]
GO

CREATE PROCEDURE [dbo].[SelectProducto]
(
	@IDProducto int
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
	WHERE [IDProducto] = @IDProducto

	SET NOCOUNT OFF
END

GO
