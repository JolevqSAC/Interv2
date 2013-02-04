IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllComentario]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllComentario]
GO

CREATE PROCEDURE [dbo].[SelectAllComentario]

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

	SET NOCOUNT OFF
END

GO
