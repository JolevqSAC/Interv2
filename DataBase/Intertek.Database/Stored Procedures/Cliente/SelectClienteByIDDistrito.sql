IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectClienteByIDDistrito]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectClienteByIDDistrito]
GO

CREATE PROCEDURE [dbo].[SelectClienteByIDDistrito]
(
	@IDDistrito int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDCliente],
	[CLI_Codigo],
	[CLI_RUC],
	[CLI_RazonSocial],
	[CLI_Direccion],
	[CLI_Telefono1],
	[CLI_Correo],
	[CLI_Fax],
	[CLI_Observaciones],
	[IDDistrito],
	[CLI_Telefono2],
	[CLI_Estado],
	[CLI_IndicadorArea],
	[CLI_UsuarioCreacion],
	[CLI_FechaHoraCreacion],
	[CLI_UsuarioModificacion],
	[CLI_FechaHoraModificacion]
	FROM [Cliente]
	WHERE [IDDistrito] = @IDDistrito

	SET NOCOUNT OFF
END

GO
