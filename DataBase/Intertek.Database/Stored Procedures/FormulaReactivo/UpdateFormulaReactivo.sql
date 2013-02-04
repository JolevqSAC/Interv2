IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateFormulaReactivo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateFormulaReactivo]
GO

CREATE PROCEDURE [dbo].[UpdateFormulaReactivo]
(
	@IDFormula int,
	@IDReactivo int,
	@FOR_Nombre char(18),
	@FOR_Cantidad char(18),
	@FOR_Observacion char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [FormulaReactivo]
	SET [IDReactivo] = @IDReactivo, 
		[FOR_Nombre] = @FOR_Nombre, 
		[FOR_Cantidad] = @FOR_Cantidad, 
		[FOR_Observacion] = @FOR_Observacion
	WHERE [IDFormula] = @IDFormula

	SET NOCOUNT OFF
END

GO
