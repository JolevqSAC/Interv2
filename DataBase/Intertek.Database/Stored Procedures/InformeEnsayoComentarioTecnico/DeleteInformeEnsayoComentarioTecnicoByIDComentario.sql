IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteInformeEnsayoComentarioTecnicoByIDComentario]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteInformeEnsayoComentarioTecnicoByIDComentario]
GO

CREATE PROCEDURE [dbo].[DeleteInformeEnsayoComentarioTecnicoByIDComentario]
(
	@IDComentario int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [InformeEnsayoComentarioTecnico]
	WHERE [IDComentario] = @IDComentario

	SET NOCOUNT OFF
END

GO
