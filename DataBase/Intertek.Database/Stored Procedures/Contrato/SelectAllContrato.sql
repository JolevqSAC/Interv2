IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllContrato]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllContrato]
GO

CREATE PROCEDURE [dbo].[SelectAllContrato]

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

	SET NOCOUNT OFF
END

GO
