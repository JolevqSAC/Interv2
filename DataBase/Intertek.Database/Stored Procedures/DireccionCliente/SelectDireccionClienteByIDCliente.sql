IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectDireccionClienteByIDCliente]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectDireccionClienteByIDCliente]
GO

CREATE PROCEDURE [dbo].[SelectDireccionClienteByIDCliente]
(
	@IDCliente int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDDireccionCliente],
	[DIC_Codigo],
	[DIC_Tipo],
	[DIC_Descripcion],
	[IDCliente],
	[DIC_Estado],
	[DIC_UsuarioCreacion],
	[DIC_FechaHoraCreacion],
	[DIC_UsuarioModificacion],
	[DIC_FechaHoraModificacion]
	FROM [DireccionCliente]
	WHERE [IDCliente] = @IDCliente

	SET NOCOUNT OFF
END

GO
