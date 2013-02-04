IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectNormaProducto]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectNormaProducto]
GO

CREATE PROCEDURE [dbo].[SelectNormaProducto]
(
	@IDNorma int
)
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
	WHERE [IDNorma] = @IDNorma

	SET NOCOUNT OFF
END

GO
