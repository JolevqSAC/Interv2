IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteFacturacionByIDFAC]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteFacturacionByIDFAC]
GO

CREATE PROCEDURE [dbo].[DeleteFacturacionByIDFAC]
(
	@IDFAC int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Facturacion]
	WHERE [IDFAC] = @IDFAC

	SET NOCOUNT OFF
END

GO
