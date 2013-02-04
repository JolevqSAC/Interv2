IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllCorrelativoCotizacion]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllCorrelativoCotizacion]
GO

CREATE PROCEDURE [dbo].[SelectAllCorrelativoCotizacion]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDCOT],
	[COT_Numero],
	[COT_Anio]
	FROM [CorrelativoCotizacion]

	SET NOCOUNT OFF
END

GO
