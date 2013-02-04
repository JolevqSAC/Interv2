IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectTrabajadorByIDCargo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectTrabajadorByIDCargo]
GO

CREATE PROCEDURE [dbo].[SelectTrabajadorByIDCargo]
(
	@IDCargo int
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
	WHERE [IDCargo] = @IDCargo

	SET NOCOUNT OFF
END

GO
