IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateFacturacion]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateFacturacion]
GO

CREATE PROCEDURE [dbo].[UpdateFacturacion]
(
	@IDFacturacion int,
	@IDPER int,
	@IDFAC int,
	@FAC_FechaEmision char(18),
	@FAC_FechaCancelada char(18),
	@FAC_Observaciones char(18),
	@FAC_Estado char(18),
	@FAC_EsCOTSC char(18),
	@FAC_MontoNeto char(18),
	@FAC_MontoIGV char(18),
	@FAC_MontoTotal char(18),
	@FAC_OrdenCompra char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [Facturacion]
	SET [FAC_FechaEmision] = @FAC_FechaEmision, 
		[FAC_FechaCancelada] = @FAC_FechaCancelada, 
		[FAC_Observaciones] = @FAC_Observaciones, 
		[FAC_Estado] = @FAC_Estado, 
		[FAC_EsCOTSC] = @FAC_EsCOTSC, 
		[FAC_MontoNeto] = @FAC_MontoNeto, 
		[FAC_MontoIGV] = @FAC_MontoIGV, 
		[FAC_MontoTotal] = @FAC_MontoTotal, 
		[FAC_OrdenCompra] = @FAC_OrdenCompra
	WHERE [IDFacturacion] = @IDFacturacion AND [IDPER] = @IDPER AND [IDFAC] = @IDFAC

	SET NOCOUNT OFF
END

GO
