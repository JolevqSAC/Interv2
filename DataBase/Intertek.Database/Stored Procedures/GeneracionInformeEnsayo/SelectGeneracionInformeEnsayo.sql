IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectGeneracionInformeEnsayo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectGeneracionInformeEnsayo]
GO

CREATE PROCEDURE [dbo].[SelectGeneracionInformeEnsayo]
(
	@IDPER int,
	@IDINF int,
	@IDInformeEnsayo int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDPER],
	[IDINF],
	[IDInformeEnsayo],
	[GIE_Fecha],
	[GIE_TipoGeneracion]
	FROM [GeneracionInformeEnsayo]
	WHERE [IDPER] = @IDPER AND [IDINF] = @IDINF AND [IDInformeEnsayo] = @IDInformeEnsayo

	SET NOCOUNT OFF
END

GO
