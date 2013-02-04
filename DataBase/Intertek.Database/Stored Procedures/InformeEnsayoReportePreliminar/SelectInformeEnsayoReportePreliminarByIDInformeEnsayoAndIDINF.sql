IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectInformeEnsayoReportePreliminarByIDInformeEnsayoAndIDINF]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectInformeEnsayoReportePreliminarByIDInformeEnsayoAndIDINF]
GO

CREATE PROCEDURE [dbo].[SelectInformeEnsayoReportePreliminarByIDInformeEnsayoAndIDINF]
(
	@IDInformeEnsayo int,
	@IDINF int
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
	WHERE [IDInformeEnsayo] = @IDInformeEnsayo AND [IDINF] = @IDINF

	SET NOCOUNT OFF
END

GO
