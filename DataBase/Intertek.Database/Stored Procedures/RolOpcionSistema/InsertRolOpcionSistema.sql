IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertRolOpcionSistema]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertRolOpcionSistema]
GO

CREATE PROCEDURE [dbo].[InsertRolOpcionSistema]
(
	@IDRolOpcionSistema int OUT,
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

	INSERT INTO [RolOpcionSistema] ([IDRol], [IDOpcionSistema], [ROS_FechaAsignacion], [ROS_Estado], [ROS_UsuarioCreacion], [ROS_FechaHoraCreacion], [ROS_UsuarioModificacion], [ROS_FechaHoraModificacion]) 
	VALUES (@IDRol, @IDOpcionSistema, @ROS_FechaAsignacion, @ROS_Estado, @ROS_UsuarioCreacion, @ROS_FechaHoraCreacion, @ROS_UsuarioModificacion, @ROS_FechaHoraModificacion)

	SET @IDRolOpcionSistema = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
