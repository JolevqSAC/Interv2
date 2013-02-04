IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertInformeEnsayoReportePreliminar]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertInformeEnsayoReportePreliminar]
GO

CREATE PROCEDURE [dbo].[InsertInformeEnsayoReportePreliminar]
(
	@IDINF int,
	@IDInformeEnsayo int,
	@IDComentario int,
	@IER_Fecha char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [InformeEnsayoReportePreliminar] ([IDINF], [IDInformeEnsayo], [IDComentario], [IER_Fecha]) 
	VALUES (@IDINF, @IDInformeEnsayo, @IDComentario, @IER_Fecha)

	SET NOCOUNT OFF
END

GO
