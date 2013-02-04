IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectInformeEnsayoReportePreliminarByIDComentario]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectInformeEnsayoReportePreliminarByIDComentario]
GO

CREATE PROCEDURE [dbo].[SelectInformeEnsayoReportePreliminarByIDComentario]
(
	@IDComentario int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDINF],
	[IDInformeEnsayo],
	[IDComentario],
	[IER_Fecha]
	FROM [InformeEnsayoReportePreliminar]
	WHERE [IDComentario] = @IDComentario

	SET NOCOUNT OFF
END

GO
