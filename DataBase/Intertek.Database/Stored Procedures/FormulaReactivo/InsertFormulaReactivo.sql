IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertFormulaReactivo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertFormulaReactivo]
GO

CREATE PROCEDURE [dbo].[InsertFormulaReactivo]
(
	@IDFormula int OUT,
	@IDReactivo int,
	@FOR_Nombre char(18),
	@FOR_Cantidad char(18),
	@FOR_Observacion char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [FormulaReactivo] ([IDReactivo], [FOR_Nombre], [FOR_Cantidad], [FOR_Observacion]) 
	VALUES (@IDReactivo, @FOR_Nombre, @FOR_Cantidad, @FOR_Observacion)

	SET @IDFormula = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
