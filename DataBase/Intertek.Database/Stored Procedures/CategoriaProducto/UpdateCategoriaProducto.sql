IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateCategoriaProducto]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateCategoriaProducto]
GO

CREATE PROCEDURE [dbo].[UpdateCategoriaProducto]
(
	@IDCategoria int,
	@CAT_Codigo varchar(10),
	@CAT_Nombre varchar(100),
	@CAT_NombreIngles varchar(100),
	@CAT_Descripcion varchar(200),
	@CAT_Estado varchar(1),
	@CAT_IndicadorArea char(1),
	@CAT_UsuarioCreacion varchar(25),
	@CAT_FechaHoraCreacion datetime,
	@CAT_UsuarioModificacion varchar(25),
	@CAT_FechaHoraModificacion datetime
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [CategoriaProducto]
	SET [CAT_Codigo] = @CAT_Codigo, 
		[CAT_Nombre] = @CAT_Nombre, 
		[CAT_NombreIngles] = @CAT_NombreIngles, 
		[CAT_Descripcion] = @CAT_Descripcion, 
		[CAT_Estado] = @CAT_Estado, 
		[CAT_IndicadorArea] = @CAT_IndicadorArea, 
		[CAT_UsuarioCreacion] = @CAT_UsuarioCreacion, 
		[CAT_FechaHoraCreacion] = @CAT_FechaHoraCreacion, 
		[CAT_UsuarioModificacion] = @CAT_UsuarioModificacion, 
		[CAT_FechaHoraModificacion] = @CAT_FechaHoraModificacion
	WHERE [IDCategoria] = @IDCategoria

	SET NOCOUNT OFF
END

GO
