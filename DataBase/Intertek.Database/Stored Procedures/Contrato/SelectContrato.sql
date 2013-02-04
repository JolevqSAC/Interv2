IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectContrato]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectContrato]
GO

CREATE PROCEDURE [dbo].[SelectContrato]
(
	@IDContrato int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDContrato],
	[CON_Codigo],
	[CON_Descripcion],
	[CON_FechaInico],
	[CON_FechaFin],
	[CON_EstadoContrato],
	[IDCliente],
	[CON_Estado],
	[CON_UsuarioCreacion],
	[CON_FechaHoraCreacion],
	[CON_UsuaroModificacion],
	[CON_FechaHoraModificacion]
	FROM [Contrato]
	WHERE [IDContrato] = @IDContrato

	SET NOCOUNT OFF
END

GO
