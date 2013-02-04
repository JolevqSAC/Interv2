IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectLugarMuestreo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectLugarMuestreo]
GO

CREATE PROCEDURE [dbo].[SelectLugarMuestreo]
(
	@IDLugarMuestreo int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDLugarMuestreo],
	[IDCliente],
	[LUM_Direccion],
	[LUM_Telefono],
	[LUM_Contacto],
	[LUM_Observaciones],
	[LUM_Estado],
	[LUM_UsuarioCreacion],
	[LUM_FechaHoraCreacion],
	[LUM_UsuarioModificacion],
	[LUM_FechaHoraModificacion]
	FROM [LugarMuestreo]
	WHERE [IDLugarMuestreo] = @IDLugarMuestreo

	SET NOCOUNT OFF
END

GO
