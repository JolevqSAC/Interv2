IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllCorrelativoOE]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllCorrelativoOE]
GO

CREATE PROCEDURE [dbo].[SelectAllCorrelativoOE]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDOE],
	[OE_Numero],
	[OE_Anio]
	FROM [CorrelativoOE]

	SET NOCOUNT OFF
END

GO
