IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectFormulaReactivoByIDReactivo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectFormulaReactivoByIDReactivo]
GO

CREATE PROCEDURE [dbo].[SelectFormulaReactivoByIDReactivo]
(
	@IDReactivo int
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
	WHERE [IDReactivo] = @IDReactivo

	SET NOCOUNT OFF
END

GO
