IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteInformeEnsayoComentarioTecnicoByIDInformeEnsayoAndIDINF]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteInformeEnsayoComentarioTecnicoByIDInformeEnsayoAndIDINF]
GO

CREATE PROCEDURE [dbo].[DeleteInformeEnsayoComentarioTecnicoByIDInformeEnsayoAndIDINF]
(
	@IDInformeEnsayo int,
	@IDINF int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [InformeEnsayoComentarioTecnico]
	WHERE [IDInformeEnsayo] = @IDInformeEnsayo AND [IDINF] = @IDINF

	SET NOCOUNT OFF
END

GO
