IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateInformeEnsayoReportePreliminar]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateInformeEnsayoReportePreliminar]
GO

CREATE PROCEDURE [dbo].[UpdateInformeEnsayoReportePreliminar]
(
	@IDINF int,
	@IDInformeEnsayo int,
	@IDComentario int,
	@IER_Fecha char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [InformeEnsayoReportePreliminar]
	SET [IDComentario] = @IDComentario, 
		[IER_Fecha] = @IER_Fecha
	WHERE [IDINF] = @IDINF AND [IDInformeEnsayo] = @IDInformeEnsayo

	SET NOCOUNT OFF
END

GO
