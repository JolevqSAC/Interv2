IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateInformeEnsayoComentarioTecnico]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateInformeEnsayoComentarioTecnico]
GO

CREATE PROCEDURE [dbo].[UpdateInformeEnsayoComentarioTecnico]
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

	UPDATE [InformeEnsayoComentarioTecnico]
	SET [IDComentario] = @IDComentario, 
		[IEC_ComentarioTecnico] = @IEC_ComentarioTecnico, 
		[IEC_Fecha] = @IEC_Fecha
	WHERE [IDEnsayo] = @IDEnsayo AND [IDINF] = @IDINF AND [IDInformeEnsayo] = @IDInformeEnsayo

	SET NOCOUNT OFF
END

GO
