IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectProveedorByIDDistrito]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectProveedorByIDDistrito]
GO

CREATE PROCEDURE [dbo].[SelectProveedorByIDDistrito]
(
	@IDDistrito int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDProveedor],
	[IDDistrito],
	[PRV_Codigo],
	[PRV_RazonSocial],
	[PRV_Direccion],
	[PRV_Telefono1],
	[PRV_Contacto],
	[PRV_Correo],
	[PRV_Fax],
	[PRV_Observaciones],
	[PRV_RUC],
	[PRV_Telefono2],
	[PRV_Estado],
	[PRV_IndicadorArea],
	[PRV_UsuarioCreacion],
	[PRV_FechaHoraCreacion],
	[PRV_UsuarioModificacion],
	[PRV_FechaHoraModificacion]
	FROM [Proveedor]
	WHERE [IDDistrito] = @IDDistrito

	SET NOCOUNT OFF
END

GO
