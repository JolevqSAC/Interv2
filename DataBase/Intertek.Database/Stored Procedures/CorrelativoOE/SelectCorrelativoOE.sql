IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectCorrelativoOE]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectCorrelativoOE]
GO

CREATE PROCEDURE [dbo].[SelectCorrelativoOE]
(
	@IDOE int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDOE],
	[OE_Numero],
	[OE_Anio]
	FROM [CorrelativoOE]
	WHERE [IDOE] = @IDOE

	SET NOCOUNT OFF
END

GO
