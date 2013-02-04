IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllTrabajador]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllTrabajador]
GO

CREATE PROCEDURE [dbo].[SelectAllTrabajador]

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

	SET NOCOUNT OFF
END

GO
