IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateProducto]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateProducto]
GO

CREATE PROCEDURE [dbo].[UpdateProducto]
(
	@IDProducto int,
	@IDUnidadMedida int,
	@PRO_Codigo varchar(10),
	@PRO_Nombre varchar(100),
	@PRO_NombreIngles varchar(100),
	@PRO_Descripcion varchar(100),
	@PRO_Estado varchar(1),
	@PRO_UsuarioCreacion varchar(25),
	@PRO_FechaHoraCreacion datetime,
	@PRO_UsuarioModificacion varchar(25),
	@PRO_FechaHoraModificacion datetime,
	@IDCategoria int
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [Producto]
	SET [IDUnidadMedida] = @IDUnidadMedida, 
		[PRO_Codigo] = @PRO_Codigo, 
		[PRO_Nombre] = @PRO_Nombre, 
		[PRO_NombreIngles] = @PRO_NombreIngles, 
		[PRO_Descripcion] = @PRO_Descripcion, 
		[PRO_Estado] = @PRO_Estado, 
		[PRO_UsuarioCreacion] = @PRO_UsuarioCreacion, 
		[PRO_FechaHoraCreacion] = @PRO_FechaHoraCreacion, 
		[PRO_UsuarioModificacion] = @PRO_UsuarioModificacion, 
		[PRO_FechaHoraModificacion] = @PRO_FechaHoraModificacion, 
		[IDCategoria] = @IDCategoria
	WHERE [IDProducto] = @IDProducto

	SET NOCOUNT OFF
END

GO
