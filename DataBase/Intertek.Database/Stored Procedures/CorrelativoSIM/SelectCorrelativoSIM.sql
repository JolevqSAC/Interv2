IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectCorrelativoSIM]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectCorrelativoSIM]
GO

CREATE PROCEDURE [dbo].[SelectCorrelativoSIM]
(
	@IDSIM int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDSIM],
	[SIM_Numero],
	[SIM_Anio]
	FROM [CorrelativoSIM]
	WHERE [IDSIM] = @IDSIM

	SET NOCOUNT OFF
END

GO
