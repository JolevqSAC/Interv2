IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertProducto]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertProducto]
GO

CREATE PROCEDURE [dbo].[InsertProducto]
(
	@IDProducto int OUT,
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

	INSERT INTO [Producto] ([IDUnidadMedida], [PRO_Codigo], [PRO_Nombre], [PRO_NombreIngles], [PRO_Descripcion], [PRO_Estado], [PRO_UsuarioCreacion], [PRO_FechaHoraCreacion], [PRO_UsuarioModificacion], [PRO_FechaHoraModificacion], [IDCategoria]) 
	VALUES (@IDUnidadMedida, @PRO_Codigo, @PRO_Nombre, @PRO_NombreIngles, @PRO_Descripcion, @PRO_Estado, @PRO_UsuarioCreacion, @PRO_FechaHoraCreacion, @PRO_UsuarioModificacion, @PRO_FechaHoraModificacion, @IDCategoria)

	SET @IDProducto = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
