IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateRolOpcionSistema]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateRolOpcionSistema]
GO

CREATE PROCEDURE [dbo].[UpdateRolOpcionSistema]
(
	@IDRolOpcionSistema int,
	@IDRol int,
	@IDOpcionSistema int,
	@ROS_FechaAsignacion datetime,
	@ROS_Estado varchar(1),
	@ROS_UsuarioCreacion varchar(25),
	@ROS_FechaHoraCreacion datetime,
	@ROS_UsuarioModificacion varchar(25),
	@ROS_FechaHoraModificacion datetime
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [RolOpcionSistema]
	SET [IDRol] = @IDRol, 
		[IDOpcionSistema] = @IDOpcionSistema, 
		[ROS_FechaAsignacion] = @ROS_FechaAsignacion, 
		[ROS_Estado] = @ROS_Estado, 
		[ROS_UsuarioCreacion] = @ROS_UsuarioCreacion, 
		[ROS_FechaHoraCreacion] = @ROS_FechaHoraCreacion, 
		[ROS_UsuarioModificacion] = @ROS_UsuarioModificacion, 
		[ROS_FechaHoraModificacion] = @ROS_FechaHoraModificacion
	WHERE [IDRolOpcionSistema] = @IDRolOpcionSistema

	SET NOCOUNT OFF
END

GO
