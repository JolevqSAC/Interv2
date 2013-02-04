IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectInformeEnsayoComentarioTecnicoByIDEnsayo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectInformeEnsayoComentarioTecnicoByIDEnsayo]
GO

CREATE PROCEDURE [dbo].[SelectInformeEnsayoComentarioTecnicoByIDEnsayo]
(
	@IDEnsayo int
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
	WHERE [IDEnsayo] = @IDEnsayo

	SET NOCOUNT OFF
END

GO
