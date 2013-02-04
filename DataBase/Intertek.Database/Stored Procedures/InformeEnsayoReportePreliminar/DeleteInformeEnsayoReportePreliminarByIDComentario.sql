IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteInformeEnsayoReportePreliminarByIDComentario]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteInformeEnsayoReportePreliminarByIDComentario]
GO

CREATE PROCEDURE [dbo].[DeleteInformeEnsayoReportePreliminarByIDComentario]
(
	@IDComentario int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [InformeEnsayoReportePreliminar]
	WHERE [IDComentario] = @IDComentario

	SET NOCOUNT OFF
END

GO
