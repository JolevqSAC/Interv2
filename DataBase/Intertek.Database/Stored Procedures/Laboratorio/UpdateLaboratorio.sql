IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateLaboratorio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateLaboratorio]
GO

CREATE PROCEDURE [dbo].[UpdateLaboratorio]
(
	@IDLaboratorio int,
	@LAB_Nombre varchar(100),
	@IDTipoLaboratorio int,
	@LAB_Estado varchar(1),
	@LAB_UsuarioCreacion varchar(25),
	@LAB_FechaHoraCreacion datetime,
	@LAB_UsuarioModificacion varchar(25),
	@LAB_FechaHoraModificacion datetime
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [Laboratorio]
	SET [LAB_Nombre] = @LAB_Nombre, 
		[IDTipoLaboratorio] = @IDTipoLaboratorio, 
		[LAB_Estado] = @LAB_Estado, 
		[LAB_UsuarioCreacion] = @LAB_UsuarioCreacion, 
		[LAB_FechaHoraCreacion] = @LAB_FechaHoraCreacion, 
		[LAB_UsuarioModificacion] = @LAB_UsuarioModificacion, 
		[LAB_FechaHoraModificacion] = @LAB_FechaHoraModificacion
	WHERE [IDLaboratorio] = @IDLaboratorio

	SET NOCOUNT OFF
END

GO
