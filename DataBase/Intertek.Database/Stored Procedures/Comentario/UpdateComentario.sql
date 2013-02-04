IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateComentario]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateComentario]
GO

CREATE PROCEDURE [dbo].[UpdateComentario]
(
	@IDComentario int,
	@COM_Codigo varchar(10),
	@COM_Nombre varchar(100),
	@COM_Descripcion varchar(800),
	@COM_Estado varchar(1),
	@COM_UsuarioCreacion varchar(25),
	@COM_FechaHoraCreacion datetime,
	@COM_UsuarioModificacion varchar(25),
	@COM_FechaHoraModificacion datetime
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [Comentario]
	SET [COM_Codigo] = @COM_Codigo, 
		[COM_Nombre] = @COM_Nombre, 
		[COM_Descripcion] = @COM_Descripcion, 
		[COM_Estado] = @COM_Estado, 
		[COM_UsuarioCreacion] = @COM_UsuarioCreacion, 
		[COM_FechaHoraCreacion] = @COM_FechaHoraCreacion, 
		[COM_UsuarioModificacion] = @COM_UsuarioModificacion, 
		[COM_FechaHoraModificacion] = @COM_FechaHoraModificacion
	WHERE [IDComentario] = @IDComentario

	SET NOCOUNT OFF
END

GO
