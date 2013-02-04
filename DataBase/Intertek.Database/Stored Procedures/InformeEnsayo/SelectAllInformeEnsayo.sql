IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllInformeEnsayo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllInformeEnsayo]
GO

CREATE PROCEDURE [dbo].[SelectAllInformeEnsayo]

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

	SET NOCOUNT OFF
END

GO
