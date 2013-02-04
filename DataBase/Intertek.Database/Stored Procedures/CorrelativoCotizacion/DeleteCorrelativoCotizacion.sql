IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteCorrelativoCotizacion]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteCorrelativoCotizacion]
GO

CREATE PROCEDURE [dbo].[DeleteCorrelativoCotizacion]
(
	@IDCOT int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [CorrelativoCotizacion]
	WHERE [IDCOT] = @IDCOT

	SET NOCOUNT OFF
END

GO
