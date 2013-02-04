IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectFacturacion]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectFacturacion]
GO

CREATE PROCEDURE [dbo].[SelectFacturacion]
(
	@IDFacturacion int,
	@IDPER int,
	@IDFAC int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDFacturacion],
	[IDPER],
	[IDFAC],
	[FAC_FechaEmision],
	[FAC_FechaCancelada],
	[FAC_Observaciones],
	[FAC_Estado],
	[FAC_EsCOTSC],
	[FAC_MontoNeto],
	[FAC_MontoIGV],
	[FAC_MontoTotal],
	[FAC_OrdenCompra]
	FROM [Facturacion]
	WHERE [IDFacturacion] = @IDFacturacion AND [IDPER] = @IDPER AND [IDFAC] = @IDFAC

	SET NOCOUNT OFF
END

GO
