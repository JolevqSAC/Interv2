IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllCorrelativoSIM]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllCorrelativoSIM]
GO

CREATE PROCEDURE [dbo].[SelectAllCorrelativoSIM]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDSIM],
	[SIM_Numero],
	[SIM_Anio]
	FROM [CorrelativoSIM]

	SET NOCOUNT OFF
END

GO
