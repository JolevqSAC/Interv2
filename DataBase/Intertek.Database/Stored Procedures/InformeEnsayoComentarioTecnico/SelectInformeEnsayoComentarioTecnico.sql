IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectInformeEnsayoComentarioTecnico]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectInformeEnsayoComentarioTecnico]
GO

CREATE PROCEDURE [dbo].[SelectInformeEnsayoComentarioTecnico]
(
	@IDEnsayo int,
	@IDINF int,
	@IDInformeEnsayo int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDEnsayo],
	[IDINF],
	[IDInformeEnsayo],
	[IDComentario],
	[IEC_ComentarioTecnico],
	[IEC_Fecha]
	FROM [InformeEnsayoComentarioTecnico]
	WHERE [IDEnsayo] = @IDEnsayo AND [IDINF] = @IDINF AND [IDInformeEnsayo] = @IDInformeEnsayo

	SET NOCOUNT OFF
END

GO
