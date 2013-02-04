IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectNormaProductoByIDProducto]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectNormaProductoByIDProducto]
GO

CREATE PROCEDURE [dbo].[SelectNormaProductoByIDProducto]
(
	@IDProducto int
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
	WHERE [IDProducto] = @IDProducto

	SET NOCOUNT OFF
END

GO
