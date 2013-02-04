IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertTrabajador]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertTrabajador]
GO

CREATE PROCEDURE [dbo].[InsertTrabajador]
(
	@IDPersonal int OUT,
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

	INSERT INTO [Trabajador] ([IDCargo], [IDDistrito], [PER_Codigo], [PER_Nombres], [PER_Apellidos], [PER_DNI], [PER_Direccion], [PER_Estado], [PER_UsuarioCreacion], [PER_FechaHoraCreacion], [PER_UsuarioModificacion], [PER_FechaHoraModificacion]) 
	VALUES (@IDCargo, @IDDistrito, @PER_Codigo, @PER_Nombres, @PER_Apellidos, @PER_DNI, @PER_Direccion, @PER_Estado, @PER_UsuarioCreacion, @PER_FechaHoraCreacion, @PER_UsuarioModificacion, @PER_FechaHoraModificacion)

	SET @IDPersonal = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
