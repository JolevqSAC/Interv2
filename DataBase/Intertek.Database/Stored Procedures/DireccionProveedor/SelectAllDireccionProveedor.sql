IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllDireccionProveedor]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllDireccionProveedor]
GO

CREATE PROCEDURE [dbo].[SelectAllDireccionProveedor]

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

	SET NOCOUNT OFF
END

GO
