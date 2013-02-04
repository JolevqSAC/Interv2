IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectFacturacionByIDFAC]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectFacturacionByIDFAC]
GO

CREATE PROCEDURE [dbo].[SelectFacturacionByIDFAC]
(
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
	WHERE [IDFAC] = @IDFAC

	SET NOCOUNT OFF
END

GO
