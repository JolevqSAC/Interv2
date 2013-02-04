IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteFacturacionByIDPER]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteFacturacionByIDPER]
GO

CREATE PROCEDURE [dbo].[DeleteFacturacionByIDPER]
(
	@IDPER int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Facturacion]
	WHERE [IDPER] = @IDPER

	SET NOCOUNT OFF
END

GO
