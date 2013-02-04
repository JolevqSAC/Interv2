IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllRolOpcionSistema]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllRolOpcionSistema]
GO

CREATE PROCEDURE [dbo].[SelectAllRolOpcionSistema]

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

	SET NOCOUNT OFF
END

GO
