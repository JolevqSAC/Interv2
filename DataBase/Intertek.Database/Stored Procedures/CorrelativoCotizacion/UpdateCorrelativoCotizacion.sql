IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateCorrelativoCotizacion]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateCorrelativoCotizacion]
GO

CREATE PROCEDURE [dbo].[UpdateCorrelativoCotizacion]
(
	@IDCOT int,
	@COT_Numero char(18),
	@COT_Anio char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [CorrelativoCotizacion]
	SET [COT_Numero] = @COT_Numero, 
		[COT_Anio] = @COT_Anio
	WHERE [IDCOT] = @IDCOT

	SET NOCOUNT OFF
END

GO
