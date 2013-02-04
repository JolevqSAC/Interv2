IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectGeneracionInformeEnsayoByIDPER]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectGeneracionInformeEnsayoByIDPER]
GO

CREATE PROCEDURE [dbo].[SelectGeneracionInformeEnsayoByIDPER]
(
	@IDPER int
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
	WHERE [IDPER] = @IDPER

	SET NOCOUNT OFF
END

GO
