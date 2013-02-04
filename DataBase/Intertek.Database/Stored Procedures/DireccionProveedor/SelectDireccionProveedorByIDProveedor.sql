IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectDireccionProveedorByIDProveedor]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectDireccionProveedorByIDProveedor]
GO

CREATE PROCEDURE [dbo].[SelectDireccionProveedorByIDProveedor]
(
	@IDProveedor int
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
	WHERE [IDProveedor] = @IDProveedor

	SET NOCOUNT OFF
END

GO
