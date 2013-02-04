IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectDireccionProveedor]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectDireccionProveedor]
GO

CREATE PROCEDURE [dbo].[SelectDireccionProveedor]
(
	@IDDireccionProveedor int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDDireccionProveedor],
	[DIP_Codigo],
	[DIP_Tipo],
	[DIP_Descripcion],
	[IDProveedor],
	[DIP_Estado],
	[DIP_UsuarioCreacion],
	[DIP_FechaHoraCreacion],
	[DIP_UsuarioModificacion],
	[DIP_FechaHoraModificacion]
	FROM [DireccionProveedor]
	WHERE [IDDireccionProveedor] = @IDDireccionProveedor

	SET NOCOUNT OFF
END

GO
