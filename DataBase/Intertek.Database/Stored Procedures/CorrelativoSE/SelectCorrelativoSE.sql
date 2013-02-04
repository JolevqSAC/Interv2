IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectCorrelativoSE]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectCorrelativoSE]
GO

CREATE PROCEDURE [dbo].[SelectCorrelativoSE]
(
	@IDSE int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDSE],
	[CSE_Numero],
	[CSE_Anio]
	FROM [CorrelativoSE]
	WHERE [IDSE] = @IDSE

	SET NOCOUNT OFF
END

GO
