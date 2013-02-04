IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectRolOpcionSistema]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectRolOpcionSistema]
GO

CREATE PROCEDURE [dbo].[SelectRolOpcionSistema]
(
	@IDRolOpcionSistema int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDRolOpcionSistema],
	[IDRol],
	[IDOpcionSistema],
	[ROS_FechaAsignacion],
	[ROS_Estado],
	[ROS_UsuarioCreacion],
	[ROS_FechaHoraCreacion],
	[ROS_UsuarioModificacion],
	[ROS_FechaHoraModificacion]
	FROM [RolOpcionSistema]
	WHERE [IDRolOpcionSistema] = @IDRolOpcionSistema

	SET NOCOUNT OFF
END

GO
