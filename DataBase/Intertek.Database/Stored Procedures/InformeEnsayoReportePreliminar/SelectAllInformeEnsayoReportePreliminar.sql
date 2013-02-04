IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllInformeEnsayoReportePreliminar]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllInformeEnsayoReportePreliminar]
GO

CREATE PROCEDURE [dbo].[SelectAllInformeEnsayoReportePreliminar]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDINF],
	[IDInformeEnsayo],
	[IDComentario],
	[IER_Fecha]
	FROM [InformeEnsayoReportePreliminar]

	SET NOCOUNT OFF
END

GO
