IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertCorrelativoCotizacion]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertCorrelativoCotizacion]
GO

CREATE PROCEDURE [dbo].[InsertCorrelativoCotizacion]
(
	@IDCOT int OUT,
	@COT_Numero char(18),
	@COT_Anio char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [CorrelativoCotizacion] ([COT_Numero], [COT_Anio]) 
	VALUES (@COT_Numero, @COT_Anio)

	SET @IDCOT = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
