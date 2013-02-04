IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteInformeEnsayoByIDComentario]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteInformeEnsayoByIDComentario]
GO

CREATE PROCEDURE [dbo].[DeleteInformeEnsayoByIDComentario]
(
	@IDComentario int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [InformeEnsayo]
	WHERE [IDComentario] = @IDComentario

	SET NOCOUNT OFF
END

GO
