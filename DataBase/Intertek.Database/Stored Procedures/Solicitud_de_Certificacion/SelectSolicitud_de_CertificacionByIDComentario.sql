IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectSolicitud_de_CertificacionByIDComentario]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectSolicitud_de_CertificacionByIDComentario]
GO

CREATE PROCEDURE [dbo].[SelectSolicitud_de_CertificacionByIDComentario]
(
	@IDComentario int
)
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
	WHERE [IDComentario] = @IDComentario

	SET NOCOUNT OFF
END

GO
