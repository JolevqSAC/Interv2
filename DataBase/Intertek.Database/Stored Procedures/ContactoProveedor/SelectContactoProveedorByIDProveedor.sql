IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectContactoProveedorByIDProveedor]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectContactoProveedorByIDProveedor]
GO

CREATE PROCEDURE [dbo].[SelectContactoProveedorByIDProveedor]
(
	@IDProveedor int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDContactoProveedor],
	[COC_Codigo],
	[COC_Nombres],
	[COC_Apellidos],
	[COC_Cargo],
	[COC_Telefono1],
	[COC_Telefono2],
	[IDProveedor],
	[COC_Estado],
	[COC_UsuarioCreacion],
	[COC_FechaHoraCreacion],
	[COC_UsuarioModificacion],
	[COC_FechaHoraModificacion]
	FROM [ContactoProveedor]
	WHERE [IDProveedor] = @IDProveedor

	SET NOCOUNT OFF
END

GO
