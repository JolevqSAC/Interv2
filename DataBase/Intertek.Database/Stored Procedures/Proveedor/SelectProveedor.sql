IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectProveedor]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectProveedor]
GO

CREATE PROCEDURE [dbo].[SelectProveedor]
(
	@IDProveedor int
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
	WHERE [IDProveedor] = @IDProveedor

	SET NOCOUNT OFF
END

GO
