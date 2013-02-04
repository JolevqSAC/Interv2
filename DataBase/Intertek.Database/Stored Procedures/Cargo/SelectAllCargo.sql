IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllCargo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllCargo]
GO

CREATE PROCEDURE [dbo].[SelectAllCargo]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDCargo],
	[CAR_Codigo],
	[CAR_Descripcion],
	[CAR_Nombre],
	[CAR_Estado],
	[CAR_UsuarioCreacion],
	[CAR_FechaHoraCreacion],
	[CAR_UsuarioModificacion],
	[CAR_FechaHoraModificacion],
	[IDArea]
	FROM [Cargo]

	SET NOCOUNT OFF
END

GO
