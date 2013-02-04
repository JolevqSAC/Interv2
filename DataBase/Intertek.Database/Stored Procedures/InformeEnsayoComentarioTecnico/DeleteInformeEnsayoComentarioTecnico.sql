IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteInformeEnsayoComentarioTecnico]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteInformeEnsayoComentarioTecnico]
GO

CREATE PROCEDURE [dbo].[DeleteInformeEnsayoComentarioTecnico]
(
	@IDEnsayo int,
	@IDINF int,
	@IDInformeEnsayo int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [InformeEnsayoComentarioTecnico]
	WHERE [IDEnsayo] = @IDEnsayo AND [IDINF] = @IDINF AND [IDInformeEnsayo] = @IDInformeEnsayo

	SET NOCOUNT OFF
END

GO
