IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteSolicitud_de_CertificacionByIDSC]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteSolicitud_de_CertificacionByIDSC]
GO

CREATE PROCEDURE [dbo].[DeleteSolicitud_de_CertificacionByIDSC]
(
	@IDSC int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Solicitud_de_Certificacion]
	WHERE [IDSC] = @IDSC

	SET NOCOUNT OFF
END

GO
