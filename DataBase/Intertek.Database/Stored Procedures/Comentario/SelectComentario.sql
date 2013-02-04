IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectComentario]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectComentario]
GO

CREATE PROCEDURE [dbo].[SelectComentario]
(
	@IDComentario int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDComentario],
	[COM_Codigo],
	[COM_Nombre],
	[COM_Descripcion],
	[COM_Estado],
	[COM_UsuarioCreacion],
	[COM_FechaHoraCreacion],
	[COM_UsuarioModificacion],
	[COM_FechaHoraModificacion]
	FROM [Comentario]
	WHERE [IDComentario] = @IDComentario

	SET NOCOUNT OFF
END

GO
