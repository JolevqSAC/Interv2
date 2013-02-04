IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectInformeEnsayoComentarioTecnicoByIDInformeEnsayoAndIDINF]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectInformeEnsayoComentarioTecnicoByIDInformeEnsayoAndIDINF]
GO

CREATE PROCEDURE [dbo].[SelectInformeEnsayoComentarioTecnicoByIDInformeEnsayoAndIDINF]
(
	@IDInformeEnsayo int,
	@IDINF int
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
	WHERE [IDInformeEnsayo] = @IDInformeEnsayo AND [IDINF] = @IDINF

	SET NOCOUNT OFF
END

GO
