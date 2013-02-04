IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectFormulaReactivo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectFormulaReactivo]
GO

CREATE PROCEDURE [dbo].[SelectFormulaReactivo]
(
	@IDFormula int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDFormula],
	[IDReactivo],
	[FOR_Nombre],
	[FOR_Cantidad],
	[FOR_Observacion]
	FROM [FormulaReactivo]
	WHERE [IDFormula] = @IDFormula

	SET NOCOUNT OFF
END

GO
