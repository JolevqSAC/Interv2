IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateEstado]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateEstado]
GO

CREATE PROCEDURE [dbo].[UpdateEstado]
(
	@IDEstado int,
	@EST_Descripcion varchar(20),
	@EST_Tipo varchar(3),
	@EST_Estado varchar(1),
	@EST_UsuarioCreacion varchar(25),
	@EST_FechaHoraCreacion datetime,
	@EST_UsuarioModificacion varchar(25),
	@EST_FechaHoraModificacion datetime
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [Estado]
	SET [EST_Descripcion] = @EST_Descripcion, 
		[EST_Tipo] = @EST_Tipo, 
		[EST_Estado] = @EST_Estado, 
		[EST_UsuarioCreacion] = @EST_UsuarioCreacion, 
		[EST_FechaHoraCreacion] = @EST_FechaHoraCreacion, 
		[EST_UsuarioModificacion] = @EST_UsuarioModificacion, 
		[EST_FechaHoraModificacion] = @EST_FechaHoraModificacion
	WHERE [IDEstado] = @IDEstado

	SET NOCOUNT OFF
END

GO
