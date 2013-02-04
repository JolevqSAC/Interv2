IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateTrabajador]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateTrabajador]
GO

CREATE PROCEDURE [dbo].[UpdateTrabajador]
(
	@IDPersonal int,
	@IDCargo int,
	@IDDistrito int,
	@PER_Codigo varchar(10),
	@PER_Nombres varchar(50),
	@PER_Apellidos varchar(150),
	@PER_DNI varchar(8),
	@PER_Direccion varchar(150),
	@PER_Estado varchar(1),
	@PER_UsuarioCreacion varchar(25),
	@PER_FechaHoraCreacion datetime,
	@PER_UsuarioModificacion varchar(25),
	@PER_FechaHoraModificacion datetime
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [Trabajador]
	SET [IDCargo] = @IDCargo, 
		[IDDistrito] = @IDDistrito, 
		[PER_Codigo] = @PER_Codigo, 
		[PER_Nombres] = @PER_Nombres, 
		[PER_Apellidos] = @PER_Apellidos, 
		[PER_DNI] = @PER_DNI, 
		[PER_Direccion] = @PER_Direccion, 
		[PER_Estado] = @PER_Estado, 
		[PER_UsuarioCreacion] = @PER_UsuarioCreacion, 
		[PER_FechaHoraCreacion] = @PER_FechaHoraCreacion, 
		[PER_UsuarioModificacion] = @PER_UsuarioModificacion, 
		[PER_FechaHoraModificacion] = @PER_FechaHoraModificacion
	WHERE [IDPersonal] = @IDPersonal

	SET NOCOUNT OFF
END

GO
