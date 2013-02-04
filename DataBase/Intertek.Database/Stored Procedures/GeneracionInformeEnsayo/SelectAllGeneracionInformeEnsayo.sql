IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllGeneracionInformeEnsayo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllGeneracionInformeEnsayo]
GO

CREATE PROCEDURE [dbo].[SelectAllGeneracionInformeEnsayo]

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

	SET NOCOUNT OFF
END

GO
