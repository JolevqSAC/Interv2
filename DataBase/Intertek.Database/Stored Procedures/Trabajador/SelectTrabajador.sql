IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectTrabajador]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectTrabajador]
GO

CREATE PROCEDURE [dbo].[SelectTrabajador]
(
	@IDPersonal int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDPersonal],
	[IDCargo],
	[IDDistrito],
	[PER_Codigo],
	[PER_Nombres],
	[PER_Apellidos],
	[PER_DNI],
	[PER_Direccion],
	[PER_Estado],
	[PER_UsuarioCreacion],
	[PER_FechaHoraCreacion],
	[PER_UsuarioModificacion],
	[PER_FechaHoraModificacion]
	FROM [Trabajador]
	WHERE [IDPersonal] = @IDPersonal

	SET NOCOUNT OFF
END

GO
