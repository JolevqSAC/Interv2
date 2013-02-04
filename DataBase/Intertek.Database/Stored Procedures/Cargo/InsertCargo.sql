IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertCargo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertCargo]
GO

CREATE PROCEDURE [dbo].[InsertCargo]
(
	@IDCargo int OUT,
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

	INSERT INTO [Cargo] ([CAR_Codigo], [CAR_Descripcion], [CAR_Nombre], [CAR_Estado], [CAR_UsuarioCreacion], [CAR_FechaHoraCreacion], [CAR_UsuarioModificacion], [CAR_FechaHoraModificacion], [IDArea]) 
	VALUES (@CAR_Codigo, @CAR_Descripcion, @CAR_Nombre, @CAR_Estado, @CAR_UsuarioCreacion, @CAR_FechaHoraCreacion, @CAR_UsuarioModificacion, @CAR_FechaHoraModificacion, @IDArea)

	SET @IDCargo = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
