IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectCargo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectCargo]
GO

CREATE PROCEDURE [dbo].[SelectCargo]
(
	@IDCargo int
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
	WHERE [IDCargo] = @IDCargo

	SET NOCOUNT OFF
END

GO
