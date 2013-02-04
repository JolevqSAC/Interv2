IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllNormaProducto]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllNormaProducto]
GO

CREATE PROCEDURE [dbo].[SelectAllNormaProducto]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDNorma],
	[IDProducto],
	[NOR_Nombre],
	[NOR_Acreditador],
	[NOR_Anio],
	[NOR_Observaciones],
	[NOR_Estado],
	[NOR_UsuarioCreacion],
	[NOR_FechaHoraCreacion],
	[NOR_UsuarioModificacion],
	[NOR_FechaHoraModificacion]
	FROM [NormaProducto]

	SET NOCOUNT OFF
END

GO
