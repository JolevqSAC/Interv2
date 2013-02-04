IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectDireccionCliente]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectDireccionCliente]
GO

CREATE PROCEDURE [dbo].[SelectDireccionCliente]
(
	@IDDireccionCliente int
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
	WHERE [IDDireccionCliente] = @IDDireccionCliente

	SET NOCOUNT OFF
END

GO
