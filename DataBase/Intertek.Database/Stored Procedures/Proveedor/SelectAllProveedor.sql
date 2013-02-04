IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllProveedor]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllProveedor]
GO

CREATE PROCEDURE [dbo].[SelectAllProveedor]

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

	SET NOCOUNT OFF
END

GO
