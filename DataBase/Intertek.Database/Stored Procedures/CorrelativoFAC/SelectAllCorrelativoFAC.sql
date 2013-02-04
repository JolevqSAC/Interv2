IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllCorrelativoFAC]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllCorrelativoFAC]
GO

CREATE PROCEDURE [dbo].[SelectAllCorrelativoFAC]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDFAC],
	[FAC_Numero],
	[FAC_Serie],
	[FAC_Anio]
	FROM [CorrelativoFAC]

	SET NOCOUNT OFF
END

GO
