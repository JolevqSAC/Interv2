IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectCorrelativoCotizacion]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectCorrelativoCotizacion]
GO

CREATE PROCEDURE [dbo].[SelectCorrelativoCotizacion]
(
	@IDCOT int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDCOT],
	[COT_Numero],
	[COT_Anio]
	FROM [CorrelativoCotizacion]
	WHERE [IDCOT] = @IDCOT

	SET NOCOUNT OFF
END

GO
