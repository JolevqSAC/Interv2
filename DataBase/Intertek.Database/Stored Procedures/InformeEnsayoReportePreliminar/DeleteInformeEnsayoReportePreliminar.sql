IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteInformeEnsayoReportePreliminar]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteInformeEnsayoReportePreliminar]
GO

CREATE PROCEDURE [dbo].[DeleteInformeEnsayoReportePreliminar]
(
	@IDINF int,
	@IDInformeEnsayo int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [InformeEnsayoReportePreliminar]
	WHERE [IDINF] = @IDINF AND [IDInformeEnsayo] = @IDInformeEnsayo

	SET NOCOUNT OFF
END

GO
