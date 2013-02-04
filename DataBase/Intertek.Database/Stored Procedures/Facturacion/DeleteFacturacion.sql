IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteFacturacion]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteFacturacion]
GO

CREATE PROCEDURE [dbo].[DeleteFacturacion]
(
	@IDFacturacion int,
	@IDPER int,
	@IDFAC int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Facturacion]
	WHERE [IDFacturacion] = @IDFacturacion AND [IDPER] = @IDPER AND [IDFAC] = @IDFAC

	SET NOCOUNT OFF
END

GO
