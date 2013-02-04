IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectLugarMuestreoByIDCliente]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectLugarMuestreoByIDCliente]
GO

CREATE PROCEDURE [dbo].[SelectLugarMuestreoByIDCliente]
(
	@IDCliente int
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
	WHERE [IDCliente] = @IDCliente

	SET NOCOUNT OFF
END

GO
