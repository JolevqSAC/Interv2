IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectContratoByIDCliente]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectContratoByIDCliente]
GO

CREATE PROCEDURE [dbo].[SelectContratoByIDCliente]
(
	@IDCliente int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDContrato],
	[CON_Codigo],
	[CON_Descripcion],
	[CON_FechaInico],
	[CON_FechaFin],
	[CON_EstadoContrato],
	[IDCliente],
	[CON_Estado],
	[CON_UsuarioCreacion],
	[CON_FechaHoraCreacion],
	[CON_UsuaroModificacion],
	[CON_FechaHoraModificacion]
	FROM [Contrato]
	WHERE [IDCliente] = @IDCliente

	SET NOCOUNT OFF
END

GO
