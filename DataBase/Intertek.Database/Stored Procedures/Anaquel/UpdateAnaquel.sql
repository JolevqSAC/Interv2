IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateAnaquel]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateAnaquel]
GO

CREATE PROCEDURE [dbo].[UpdateAnaquel]
(
	@IDAnaquel int,
	@IDLaboratorio int,
	@ANA_Nombre varchar(50),
	@ANA_Descripcion varchar(200),
	@ANA_Capacidad decimal(12, 2),
	@ANA_Estado varchar(1),
	@ANA_UsuarioCreacion varchar(25),
	@ANA_FechaHoraCreacion datetime,
	@ANA_UsuarioModificacion varchar(25),
	@ANA_FechaHoraModificacion datetime
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [Anaquel]
	SET [IDLaboratorio] = @IDLaboratorio, 
		[ANA_Nombre] = @ANA_Nombre, 
		[ANA_Descripcion] = @ANA_Descripcion, 
		[ANA_Capacidad] = @ANA_Capacidad, 
		[ANA_Estado] = @ANA_Estado, 
		[ANA_UsuarioCreacion] = @ANA_UsuarioCreacion, 
		[ANA_FechaHoraCreacion] = @ANA_FechaHoraCreacion, 
		[ANA_UsuarioModificacion] = @ANA_UsuarioModificacion, 
		[ANA_FechaHoraModificacion] = @ANA_FechaHoraModificacion
	WHERE [IDAnaquel] = @IDAnaquel

	SET NOCOUNT OFF
END

GO
