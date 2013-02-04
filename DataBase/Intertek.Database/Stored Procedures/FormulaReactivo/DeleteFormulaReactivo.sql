IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteFormulaReactivo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteFormulaReactivo]
GO

CREATE PROCEDURE [dbo].[DeleteFormulaReactivo]
(
	@IDFormula int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [FormulaReactivo]
	WHERE [IDFormula] = @IDFormula

	SET NOCOUNT OFF
END

GO
