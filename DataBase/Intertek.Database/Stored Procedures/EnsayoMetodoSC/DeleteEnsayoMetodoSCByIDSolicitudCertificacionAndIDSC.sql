IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteEnsayoMetodoSCByIDSolicitudCertificacionAndIDSC]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteEnsayoMetodoSCByIDSolicitudCertificacionAndIDSC]
GO

CREATE PROCEDURE [dbo].[DeleteEnsayoMetodoSCByIDSolicitudCertificacionAndIDSC]
(
	@IDSolicitudCertificacion int,
	@IDSC int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [EnsayoMetodoSC]
	WHERE [IDSolicitudCertificacion] = @IDSolicitudCertificacion AND [IDSC] = @IDSC

	SET NOCOUNT OFF
END

GO
