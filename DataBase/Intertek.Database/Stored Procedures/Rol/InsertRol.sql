IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertRol]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertRol]
GO

CREATE PROCEDURE [dbo].[InsertRol]
(
	@IDRol int OUT,
	@ROL_Codigo varchar(10),
	@ROL_Nombre varchar(100),
	@ROL_NombreIngles varchar(100),
	@ROL_Descripcion varchar(200),
	@ROL_Estado varchar(1),
	@ROL_UsuarioCreacion varchar(25),
	@ROL_FechaHoraCreacion datetime,
	@ROL_UsuarioModificacion varchar(25),
	@ROL_FechaHoraModificacion datetime
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [Rol] ([ROL_Codigo], [ROL_Nombre], [ROL_NombreIngles], [ROL_Descripcion], [ROL_Estado], [ROL_UsuarioCreacion], [ROL_FechaHoraCreacion], [ROL_UsuarioModificacion], [ROL_FechaHoraModificacion]) 
	VALUES (@ROL_Codigo, @ROL_Nombre, @ROL_NombreIngles, @ROL_Descripcion, @ROL_Estado, @ROL_UsuarioCreacion, @ROL_FechaHoraCreacion, @ROL_UsuarioModificacion, @ROL_FechaHoraModificacion)

	SET @IDRol = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
