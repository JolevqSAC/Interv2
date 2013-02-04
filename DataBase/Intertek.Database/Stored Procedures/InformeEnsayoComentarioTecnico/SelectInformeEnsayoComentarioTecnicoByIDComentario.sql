IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectInformeEnsayoComentarioTecnicoByIDComentario]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectInformeEnsayoComentarioTecnicoByIDComentario]
GO

CREATE PROCEDURE [dbo].[SelectInformeEnsayoComentarioTecnicoByIDComentario]
(
	@IDComentario int
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
	WHERE [IDComentario] = @IDComentario

	SET NOCOUNT OFF
END

GO
