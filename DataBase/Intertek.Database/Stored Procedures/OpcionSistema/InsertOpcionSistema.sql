IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertOpcionSistema]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertOpcionSistema]
GO

CREATE PROCEDURE [dbo].[InsertOpcionSistema]
(
	@IDOpcionSistema int OUT,
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

	INSERT INTO [OpcionSistema] ([OSI_Nombre], [OSI_Modulo], [OSI_Estado], [OSI_Nombre_en-US], [OSI_Modulo_en-US], [OSI_RutaPagina], [OSI_UsuarioCreacion], [OSI_FechaHoraCreacion], [OSI_UsuarioModificacion], [OSI_FechaHoraModificacion], [OSI_Codigo]) 
	VALUES (@OSI_Nombre, @OSI_Modulo, @OSI_Estado, @OSI_Nombre_en-US, @OSI_Modulo_en-US, @OSI_RutaPagina, @OSI_UsuarioCreacion, @OSI_FechaHoraCreacion, @OSI_UsuarioModificacion, @OSI_FechaHoraModificacion, @OSI_Codigo)

	SET @IDOpcionSistema = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
