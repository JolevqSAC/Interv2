IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectCorrelativoSC]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectCorrelativoSC]
GO

CREATE PROCEDURE [dbo].[SelectCorrelativoSC]
(
	@IDSC int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDSC],
	[SC_Numero],
	[SC_Anio]
	FROM [CorrelativoSC]
	WHERE [IDSC] = @IDSC

	SET NOCOUNT OFF
END

GO
