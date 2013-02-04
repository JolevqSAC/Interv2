IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllProducto]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllProducto]
GO

CREATE PROCEDURE [dbo].[SelectAllProducto]

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

	SET NOCOUNT OFF
END

GO
