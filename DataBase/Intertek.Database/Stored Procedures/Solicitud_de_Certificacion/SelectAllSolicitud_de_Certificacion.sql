IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllSolicitud_de_Certificacion]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllSolicitud_de_Certificacion]
GO

CREATE PROCEDURE [dbo].[SelectAllSolicitud_de_Certificacion]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDSolicitudCertificacion],
	[IDSC],
	[IDCliente],
	[IDLugarMuestreo],
	[IDComentario],
	[SOC_FechaEntrega],
	[SOC_Certificado],
	[SOC_Monto],
	[SOC_InstruccionesPago],
	[SOC_InfoAdicional],
	[IDEvaluadorInterno],
	[IDJefeCertificacion],
	[IDProducto],
	[IDPER],
	[IDNorma],
	[IDNormaMuestreo],
	[SOC_Dirimente],
	[SOC_TiempoCustodia],
	[SOC_DestinoMuestra],
	[SOC_Ambientacion],
	[SOC_DiasAdicionales],
	[SOC_CantidadMuestra],
	[SOC_Lote],
	[SOC_PlanMuestreo],
	[SOC_IncluyeIGV],
	[SOC_DirimenteEnAlmacen],
	[SOC_FechaAprobacion],
	[SOC_Estado],
	[IDEvaluadorExterno],
	[SOC_SistemaCertificacion]
	FROM [Solicitud_de_Certificacion]

	SET NOCOUNT OFF
END

GO
