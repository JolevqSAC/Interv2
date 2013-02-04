IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllFormulaReactivo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllFormulaReactivo]
GO

CREATE PROCEDURE [dbo].[SelectAllFormulaReactivo]

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

	SET NOCOUNT OFF
END

GO
