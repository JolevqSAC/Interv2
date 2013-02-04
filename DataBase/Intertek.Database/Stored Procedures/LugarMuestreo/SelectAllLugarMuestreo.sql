IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllLugarMuestreo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllLugarMuestreo]
GO

CREATE PROCEDURE [dbo].[SelectAllLugarMuestreo]

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

	SET NOCOUNT OFF
END

GO
