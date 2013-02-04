IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectInformeEnsayo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectInformeEnsayo]
GO

CREATE PROCEDURE [dbo].[SelectInformeEnsayo]
(
	@IDInformeEnsayo int,
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
	WHERE [IDInformeEnsayo] = @IDInformeEnsayo AND [IDINF] = @IDINF

	SET NOCOUNT OFF
END

GO
