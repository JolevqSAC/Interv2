IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllCategoriaProducto]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllCategoriaProducto]
GO

CREATE PROCEDURE [dbo].[SelectAllCategoriaProducto]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDCategoria],
	[CAT_Codigo],
	[CAT_Nombre],
	[CAT_NombreIngles],
	[CAT_Descripcion],
	[CAT_Estado],
	[CAT_IndicadorArea],
	[CAT_UsuarioCreacion],
	[CAT_FechaHoraCreacion],
	[CAT_UsuarioModificacion],
	[CAT_FechaHoraModificacion]
	FROM [CategoriaProducto]

	SET NOCOUNT OFF
END

GO
