IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectTrabajadorByIDDistrito]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectTrabajadorByIDDistrito]
GO

CREATE PROCEDURE [dbo].[SelectTrabajadorByIDDistrito]
(
	@IDDistrito int
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
	WHERE [IDDistrito] = @IDDistrito

	SET NOCOUNT OFF
END

GO
