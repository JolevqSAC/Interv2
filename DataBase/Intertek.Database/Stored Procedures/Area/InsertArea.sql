IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertArea]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertArea]
GO

CREATE PROCEDURE [dbo].[InsertArea]
(
	@IDArea int OUT,
	@ARE_Codigo varchar(10),
	@ARE_Nombre varchar(50),
	@ARE_Descripcion varchar(150),
	@ARE_Estado varchar(1),
	@ARE_UsuarioCreaccion varchar(25),
	@ARE_UsuarioModificacion varchar(25)
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [Area] ([ARE_Codigo], [ARE_Nombre], [ARE_Descripcion], [ARE_Estado], [ARE_UsuarioCreaccion], [ARE_FechaHoraCreacion], [ARE_UsuarioModificacion], [ARE_FechaHoraModificacion]) 
	VALUES (@ARE_Codigo, @ARE_Nombre, @ARE_Descripcion, @ARE_Estado, @ARE_UsuarioCreaccion, getdate(), @ARE_UsuarioModificacion, getdate())

	SET @IDArea = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
