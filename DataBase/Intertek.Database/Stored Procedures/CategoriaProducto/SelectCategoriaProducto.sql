IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectCategoriaProducto]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectCategoriaProducto]
GO

CREATE PROCEDURE [dbo].[SelectCategoriaProducto]
(
	@IDCategoria int
)
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
	WHERE [IDCategoria] = @IDCategoria

	SET NOCOUNT OFF
END

GO
