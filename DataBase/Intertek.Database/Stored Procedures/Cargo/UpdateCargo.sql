IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateCargo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateCargo]
GO

CREATE PROCEDURE [dbo].[UpdateCargo]
(
	@IDCargo int,
	@CAR_Codigo varchar(10),
	@CAR_Descripcion varchar(200),
	@CAR_Nombre varchar(50),
	@CAR_Estado varchar(1),
	@CAR_UsuarioCreacion varchar(25),
	@CAR_FechaHoraCreacion datetime,
	@CAR_UsuarioModificacion varchar(25),
	@CAR_FechaHoraModificacion datetime,
	@IDArea int
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [Cargo]
	SET [CAR_Codigo] = @CAR_Codigo, 
		[CAR_Descripcion] = @CAR_Descripcion, 
		[CAR_Nombre] = @CAR_Nombre, 
		[CAR_Estado] = @CAR_Estado, 
		[CAR_UsuarioCreacion] = @CAR_UsuarioCreacion, 
		[CAR_FechaHoraCreacion] = @CAR_FechaHoraCreacion, 
		[CAR_UsuarioModificacion] = @CAR_UsuarioModificacion, 
		[CAR_FechaHoraModificacion] = @CAR_FechaHoraModificacion, 
		[IDArea] = @IDArea
	WHERE [IDCargo] = @IDCargo

	SET NOCOUNT OFF
END

GO
