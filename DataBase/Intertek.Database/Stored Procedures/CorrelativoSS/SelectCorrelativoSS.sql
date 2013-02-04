IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectCorrelativoSS]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectCorrelativoSS]
GO

CREATE PROCEDURE [dbo].[SelectCorrelativoSS]
(
	@IDSS int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDSS],
	[SS_Numero],
	[SS_Anio]
	FROM [CorrelativoSS]
	WHERE [IDSS] = @IDSS

	SET NOCOUNT OFF
END

GO
