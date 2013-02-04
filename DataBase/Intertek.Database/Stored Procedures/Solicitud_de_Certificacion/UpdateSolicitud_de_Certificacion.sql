IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateSolicitud_de_Certificacion]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateSolicitud_de_Certificacion]
GO

CREATE PROCEDURE [dbo].[UpdateSolicitud_de_Certificacion]
(
	@IDSolicitudCertificacion int,
	@IDSC int,
	@IDCliente int,
	@IDLugarMuestreo int,
	@IDComentario int,
	@SOC_FechaEntrega char(18),
	@SOC_Certificado char(18),
	@SOC_Monto char(18),
	@SOC_InstruccionesPago char(18),
	@SOC_InfoAdicional char(18),
	@IDEvaluadorInterno int,
	@IDJefeCertificacion int,
	@IDProducto int,
	@IDPER int,
	@IDNorma int,
	@IDNormaMuestreo int,
	@SOC_Dirimente char(18),
	@SOC_TiempoCustodia char(18),
	@SOC_DestinoMuestra char(18),
	@SOC_Ambientacion char(18),
	@SOC_DiasAdicionales char(18),
	@SOC_CantidadMuestra char(18),
	@SOC_Lote char(18),
	@SOC_PlanMuestreo char(18),
	@SOC_IncluyeIGV char(18),
	@SOC_DirimenteEnAlmacen char(18),
	@SOC_FechaAprobacion char(18),
	@SOC_Estado char(18),
	@IDEvaluadorExterno int,
	@SOC_SistemaCertificacion char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [Solicitud_de_Certificacion]
	SET [IDCliente] = @IDCliente, 
		[IDLugarMuestreo] = @IDLugarMuestreo, 
		[IDComentario] = @IDComentario, 
		[SOC_FechaEntrega] = @SOC_FechaEntrega, 
		[SOC_Certificado] = @SOC_Certificado, 
		[SOC_Monto] = @SOC_Monto, 
		[SOC_InstruccionesPago] = @SOC_InstruccionesPago, 
		[SOC_InfoAdicional] = @SOC_InfoAdicional, 
		[IDEvaluadorInterno] = @IDEvaluadorInterno, 
		[IDJefeCertificacion] = @IDJefeCertificacion, 
		[IDProducto] = @IDProducto, 
		[IDPER] = @IDPER, 
		[IDNorma] = @IDNorma, 
		[IDNormaMuestreo] = @IDNormaMuestreo, 
		[SOC_Dirimente] = @SOC_Dirimente, 
		[SOC_TiempoCustodia] = @SOC_TiempoCustodia, 
		[SOC_DestinoMuestra] = @SOC_DestinoMuestra, 
		[SOC_Ambientacion] = @SOC_Ambientacion, 
		[SOC_DiasAdicionales] = @SOC_DiasAdicionales, 
		[SOC_CantidadMuestra] = @SOC_CantidadMuestra, 
		[SOC_Lote] = @SOC_Lote, 
		[SOC_PlanMuestreo] = @SOC_PlanMuestreo, 
		[SOC_IncluyeIGV] = @SOC_IncluyeIGV, 
		[SOC_DirimenteEnAlmacen] = @SOC_DirimenteEnAlmacen, 
		[SOC_FechaAprobacion] = @SOC_FechaAprobacion, 
		[SOC_Estado] = @SOC_Estado, 
		[IDEvaluadorExterno] = @IDEvaluadorExterno, 
		[SOC_SistemaCertificacion] = @SOC_SistemaCertificacion
	WHERE [IDSolicitudCertificacion] = @IDSolicitudCertificacion AND [IDSC] = @IDSC

	SET NOCOUNT OFF
END

GO
