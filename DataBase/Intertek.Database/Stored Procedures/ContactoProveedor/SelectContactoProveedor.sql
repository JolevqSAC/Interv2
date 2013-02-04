IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectContactoProveedor]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectContactoProveedor]
GO

CREATE PROCEDURE [dbo].[SelectContactoProveedor]
(
	@IDContactoProveedor int
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
	WHERE [IDContactoProveedor] = @IDContactoProveedor

	SET NOCOUNT OFF
END

GO
