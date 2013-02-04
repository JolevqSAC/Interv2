IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllFacturacion]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllFacturacion]
GO

CREATE PROCEDURE [dbo].[SelectAllFacturacion]

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

	SET NOCOUNT OFF
END

GO
