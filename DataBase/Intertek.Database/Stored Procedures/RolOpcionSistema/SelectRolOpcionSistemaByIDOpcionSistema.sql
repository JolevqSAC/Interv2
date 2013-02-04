IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectRolOpcionSistemaByIDOpcionSistema]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectRolOpcionSistemaByIDOpcionSistema]
GO

CREATE PROCEDURE [dbo].[SelectRolOpcionSistemaByIDOpcionSistema]
(
	@IDOpcionSistema int
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
	WHERE [IDOpcionSistema] = @IDOpcionSistema

	SET NOCOUNT OFF
END

GO
