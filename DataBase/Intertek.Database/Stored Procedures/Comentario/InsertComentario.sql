IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertComentario]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertComentario]
GO

CREATE PROCEDURE [dbo].[InsertComentario]
(
	@IDComentario int OUT,
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

	INSERT INTO [Comentario] ([COM_Codigo], [COM_Nombre], [COM_Descripcion], [COM_Estado], [COM_UsuarioCreacion], [COM_FechaHoraCreacion], [COM_UsuarioModificacion], [COM_FechaHoraModificacion]) 
	VALUES (@COM_Codigo, @COM_Nombre, @COM_Descripcion, @COM_Estado, @COM_UsuarioCreacion, @COM_FechaHoraCreacion, @COM_UsuarioModificacion, @COM_FechaHoraModificacion)

	SET @IDComentario = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
