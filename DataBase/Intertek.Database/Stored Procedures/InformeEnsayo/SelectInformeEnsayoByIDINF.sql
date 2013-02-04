IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectInformeEnsayoByIDINF]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectInformeEnsayoByIDINF]
GO

CREATE PROCEDURE [dbo].[SelectInformeEnsayoByIDINF]
(
	@IDINF int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDInformeEnsayo],
	[IDINF],
	[IDComentario],
	[IDJefeLaboratorio],
	[INE_Fecha],
	[IDAsistenteLaboratorio]
	FROM [InformeEnsayo]
	WHERE [IDINF] = @IDINF

	SET NOCOUNT OFF
END

GO
