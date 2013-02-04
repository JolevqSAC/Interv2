IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllInformeEnsayoComentarioTecnico]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllInformeEnsayoComentarioTecnico]
GO

CREATE PROCEDURE [dbo].[SelectAllInformeEnsayoComentarioTecnico]

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

	SET NOCOUNT OFF
END

GO
