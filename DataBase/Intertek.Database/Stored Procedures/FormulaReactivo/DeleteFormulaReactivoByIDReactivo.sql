IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteFormulaReactivoByIDReactivo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteFormulaReactivoByIDReactivo]
GO

CREATE PROCEDURE [dbo].[DeleteFormulaReactivoByIDReactivo]
(
	@IDReactivo int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [FormulaReactivo]
	WHERE [IDReactivo] = @IDReactivo

	SET NOCOUNT OFF
END

GO
