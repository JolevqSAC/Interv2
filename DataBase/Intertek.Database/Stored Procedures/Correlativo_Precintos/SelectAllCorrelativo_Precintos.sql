IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllCorrelativo_Precintos]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllCorrelativo_Precintos]
GO

CREATE PROCEDURE [dbo].[SelectAllCorrelativo_Precintos]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDPrecintos],
	[PRE_Numero],
	[PRE_Anio]
	FROM [Correlativo_Precintos]

	SET NOCOUNT OFF
END

GO
