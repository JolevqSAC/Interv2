IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectInformeEnsayoByIDAsistenteLaboratorio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectInformeEnsayoByIDAsistenteLaboratorio]
GO

CREATE PROCEDURE [dbo].[SelectInformeEnsayoByIDAsistenteLaboratorio]
(
	@IDAsistenteLaboratorio int
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
	WHERE [IDAsistenteLaboratorio] = @IDAsistenteLaboratorio

	SET NOCOUNT OFF
END

GO
