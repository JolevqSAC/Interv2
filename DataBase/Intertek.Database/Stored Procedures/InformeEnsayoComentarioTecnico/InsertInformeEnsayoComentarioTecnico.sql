IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertInformeEnsayoComentarioTecnico]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertInformeEnsayoComentarioTecnico]
GO

CREATE PROCEDURE [dbo].[InsertInformeEnsayoComentarioTecnico]
(
	@IDEnsayo int,
	@IDINF int,
	@IDInformeEnsayo int,
	@IDComentario int,
	@IEC_ComentarioTecnico char(18),
	@IEC_Fecha char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [InformeEnsayoComentarioTecnico] ([IDEnsayo], [IDINF], [IDInformeEnsayo], [IDComentario], [IEC_ComentarioTecnico], [IEC_Fecha]) 
	VALUES (@IDEnsayo, @IDINF, @IDInformeEnsayo, @IDComentario, @IEC_ComentarioTecnico, @IEC_Fecha)

	SET NOCOUNT OFF
END

GO
