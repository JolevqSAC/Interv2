IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectRolOpcionSistemaByIDRol]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectRolOpcionSistemaByIDRol]
GO

CREATE PROCEDURE [dbo].[SelectRolOpcionSistemaByIDRol]
(
	@IDRol int
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
	WHERE [IDRol] = @IDRol

	SET NOCOUNT OFF
END

GO
