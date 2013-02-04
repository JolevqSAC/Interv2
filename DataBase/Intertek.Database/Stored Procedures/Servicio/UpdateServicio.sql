IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateServicio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateServicio]
GO

CREATE PROCEDURE [dbo].[UpdateServicio]
(
	@IDServicio int,
	@SER_Codigo varchar(10),
	@SER_Nombre varchar(100),
	@SER_NombreIngles varchar(100),
	@SER_Descripcion varchar(200),
	@SER_Estado varchar(1),
	@SER_UsuarioCreacion varchar(25),
	@SER_FechaHoraCreacion datetime,
	@SER_UsuarioModificacion varchar(25),
	@SER_FechaHoraModificacion datetime
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [Servicio]
	SET [SER_Codigo] = @SER_Codigo, 
		[SER_Nombre] = @SER_Nombre, 
		[SER_NombreIngles] = @SER_NombreIngles, 
		[SER_Descripcion] = @SER_Descripcion, 
		[SER_Estado] = @SER_Estado, 
		[SER_UsuarioCreacion] = @SER_UsuarioCreacion, 
		[SER_FechaHoraCreacion] = @SER_FechaHoraCreacion, 
		[SER_UsuarioModificacion] = @SER_UsuarioModificacion, 
		[SER_FechaHoraModificacion] = @SER_FechaHoraModificacion
	WHERE [IDServicio] = @IDServicio

	SET NOCOUNT OFF
END

GO
