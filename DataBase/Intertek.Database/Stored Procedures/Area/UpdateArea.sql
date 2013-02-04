IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateArea]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateArea]
GO

CREATE PROCEDURE [dbo].[UpdateArea]
(
	@IDArea int,
	@ARE_Codigo varchar(10),
	@ARE_Nombre varchar(50),
	@ARE_Descripcion varchar(150),
	@ARE_Estado varchar(1),
	@ARE_UsuarioModificacion varchar(25)

)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [Area]
	SET [ARE_Codigo] = @ARE_Codigo, 
		[ARE_Nombre] = @ARE_Nombre, 
		[ARE_Descripcion] = @ARE_Descripcion, 
		[ARE_Estado] = @ARE_Estado, 
		[ARE_UsuarioModificacion] = @ARE_UsuarioModificacion, 
		[ARE_FechaHoraModificacion] = getdate()
	WHERE [IDArea] = @IDArea

	SET NOCOUNT OFF
END

GO
