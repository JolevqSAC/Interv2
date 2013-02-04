IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectContactoClienteByIDCliente]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectContactoClienteByIDCliente]
GO

CREATE PROCEDURE [dbo].[SelectContactoClienteByIDCliente]
(
	@IDCliente int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDContactoCliente],
	[COC_Codigo],
	[COC_Nombres],
	[COC_Apellidos],
	[COC_Cargo],
	[COC_Telefono1],
	[COC_Telefono2],
	[IDCliente],
	[COC_Estado],
	[COC_UsuarioCreacion],
	[COC_FechaHoraCreacion],
	[COC_UsuarioModificacion],
	[COC_FechaHoraModificacion]
	FROM [ContactoCliente]
	WHERE [IDCliente] = @IDCliente

	SET NOCOUNT OFF
END

GO
