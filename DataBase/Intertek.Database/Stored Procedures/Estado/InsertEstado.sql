IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertEstado]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertEstado]
GO

CREATE PROCEDURE [dbo].[InsertEstado]
(
	@IDEstado int OUT,
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

	INSERT INTO [Estado] ([EST_Descripcion], [EST_Tipo], [EST_Estado], [EST_UsuarioCreacion], [EST_FechaHoraCreacion], [EST_UsuarioModificacion], [EST_FechaHoraModificacion]) 
	VALUES (@EST_Descripcion, @EST_Tipo, @EST_Estado, @EST_UsuarioCreacion, @EST_FechaHoraCreacion, @EST_UsuarioModificacion, @EST_FechaHoraModificacion)

	SET @IDEstado = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
