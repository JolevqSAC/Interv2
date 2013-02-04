IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllCompraReactivos]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllCompraReactivos]
GO

CREATE PROCEDURE [dbo].[SelectAllCompraReactivos]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDCompra],
	[IDReactivo],
	[COM_Fecha],
	[COM_CodigoCompra],
	[COM_AvisoTiempo],
	[COM_Cantidad]
	FROM [CompraReactivos]

	SET NOCOUNT OFF
END

GO
