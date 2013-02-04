IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectInformeEnsayoByIDJefeLaboratorio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectInformeEnsayoByIDJefeLaboratorio]
GO

CREATE PROCEDURE [dbo].[SelectInformeEnsayoByIDJefeLaboratorio]
(
	@IDJefeLaboratorio int
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
	WHERE [IDJefeLaboratorio] = @IDJefeLaboratorio

	SET NOCOUNT OFF
END

GO
