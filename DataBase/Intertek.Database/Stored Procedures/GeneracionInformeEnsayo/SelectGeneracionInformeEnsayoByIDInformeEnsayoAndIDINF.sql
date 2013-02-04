IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectGeneracionInformeEnsayoByIDInformeEnsayoAndIDINF]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectGeneracionInformeEnsayoByIDInformeEnsayoAndIDINF]
GO

CREATE PROCEDURE [dbo].[SelectGeneracionInformeEnsayoByIDInformeEnsayoAndIDINF]
(
	@IDInformeEnsayo int,
	@IDINF int
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
	WHERE [IDInformeEnsayo] = @IDInformeEnsayo AND [IDINF] = @IDINF

	SET NOCOUNT OFF
END

GO
