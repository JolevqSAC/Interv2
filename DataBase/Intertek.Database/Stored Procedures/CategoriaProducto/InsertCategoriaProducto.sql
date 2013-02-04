IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertCategoriaProducto]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertCategoriaProducto]
GO

CREATE PROCEDURE [dbo].[InsertCategoriaProducto]
(
	@IDCategoria int OUT,
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

	INSERT INTO [CategoriaProducto] ([CAT_Codigo], [CAT_Nombre], [CAT_NombreIngles], [CAT_Descripcion], [CAT_Estado], [CAT_IndicadorArea], [CAT_UsuarioCreacion], [CAT_FechaHoraCreacion], [CAT_UsuarioModificacion], [CAT_FechaHoraModificacion]) 
	VALUES (@CAT_Codigo, @CAT_Nombre, @CAT_NombreIngles, @CAT_Descripcion, @CAT_Estado, @CAT_IndicadorArea, @CAT_UsuarioCreacion, @CAT_FechaHoraCreacion, @CAT_UsuarioModificacion, @CAT_FechaHoraModificacion)

	SET @IDCategoria = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
