IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertFacturacion]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertFacturacion]
GO

CREATE PROCEDURE [dbo].[InsertFacturacion]
(
	@IDFacturacion int OUT,
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

	INSERT INTO [Facturacion] ([IDPER], [IDFAC], [FAC_FechaEmision], [FAC_FechaCancelada], [FAC_Observaciones], [FAC_Estado], [FAC_EsCOTSC], [FAC_MontoNeto], [FAC_MontoIGV], [FAC_MontoTotal], [FAC_OrdenCompra]) 
	VALUES (@IDPER, @IDFAC, @FAC_FechaEmision, @FAC_FechaCancelada, @FAC_Observaciones, @FAC_Estado, @FAC_EsCOTSC, @FAC_MontoNeto, @FAC_MontoIGV, @FAC_MontoTotal, @FAC_OrdenCompra)

	SET @IDFacturacion = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
