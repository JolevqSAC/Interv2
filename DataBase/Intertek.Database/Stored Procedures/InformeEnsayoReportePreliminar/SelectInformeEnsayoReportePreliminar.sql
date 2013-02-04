IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectInformeEnsayoReportePreliminar]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectInformeEnsayoReportePreliminar]
GO

CREATE PROCEDURE [dbo].[SelectInformeEnsayoReportePreliminar]
(
	@IDINF int,
	@IDInformeEnsayo int
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
	WHERE [IDINF] = @IDINF AND [IDInformeEnsayo] = @IDInformeEnsayo

	SET NOCOUNT OFF
END

GO
