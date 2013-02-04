IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateOpcionSistema]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateOpcionSistema]
GO

CREATE PROCEDURE [dbo].[UpdateOpcionSistema]
(
	@IDOpcionSistema int,
	@OSI_Nombre varchar(100),
	@OSI_Modulo varchar(100),
	@OSI_Estado varchar(1),
	@OSI_Nombre_en-US varchar(100),
	@OSI_Modulo_en-US varchar(100),
	@OSI_RutaPagina varchar(50),
	@OSI_UsuarioCreacion varchar(25),
	@OSI_FechaHoraCreacion datetime,
	@OSI_UsuarioModificacion varchar(25),
	@OSI_FechaHoraModificacion datetime,
	@OSI_Codigo varchar(10)
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [OpcionSistema]
	SET [OSI_Nombre] = @OSI_Nombre, 
		[OSI_Modulo] = @OSI_Modulo, 
		[OSI_Estado] = @OSI_Estado, 
		[OSI_Nombre_en-US] = @OSI_Nombre_en-US, 
		[OSI_Modulo_en-US] = @OSI_Modulo_en-US, 
		[OSI_RutaPagina] = @OSI_RutaPagina, 
		[OSI_UsuarioCreacion] = @OSI_UsuarioCreacion, 
		[OSI_FechaHoraCreacion] = @OSI_FechaHoraCreacion, 
		[OSI_UsuarioModificacion] = @OSI_UsuarioModificacion, 
		[OSI_FechaHoraModificacion] = @OSI_FechaHoraModificacion, 
		[OSI_Codigo] = @OSI_Codigo
	WHERE [IDOpcionSistema] = @IDOpcionSistema

	SET NOCOUNT OFF
END

GO
