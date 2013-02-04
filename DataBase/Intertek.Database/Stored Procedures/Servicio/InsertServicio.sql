IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertServicio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertServicio]
GO

CREATE PROCEDURE [dbo].[InsertServicio]
(
	@IDServicio int OUT,
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

	INSERT INTO [Servicio] ([SER_Codigo], [SER_Nombre], [SER_NombreIngles], [SER_Descripcion], [SER_Estado], [SER_UsuarioCreacion], [SER_FechaHoraCreacion], [SER_UsuarioModificacion], [SER_FechaHoraModificacion]) 
	VALUES (@SER_Codigo, @SER_Nombre, @SER_NombreIngles, @SER_Descripcion, @SER_Estado, @SER_UsuarioCreacion, @SER_FechaHoraCreacion, @SER_UsuarioModificacion, @SER_FechaHoraModificacion)

	SET @IDServicio = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
