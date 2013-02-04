IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteComentario]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteComentario]
GO

CREATE PROCEDURE [dbo].[DeleteComentario]
(
	@IDComentario int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Comentario]
	WHERE [IDComentario] = @IDComentario

	SET NOCOUNT OFF
END

GO
