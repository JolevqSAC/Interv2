IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectCargoByIDArea]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectCargoByIDArea]
GO

CREATE PROCEDURE [dbo].[SelectCargoByIDArea]
(
	@IDArea int
)
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
	WHERE [IDArea] = @IDArea

	SET NOCOUNT OFF
END

GO
