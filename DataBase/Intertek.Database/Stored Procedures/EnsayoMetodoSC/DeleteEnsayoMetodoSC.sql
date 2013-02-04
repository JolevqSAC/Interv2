IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteEnsayoMetodoSC]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteEnsayoMetodoSC]
GO

CREATE PROCEDURE [dbo].[DeleteEnsayoMetodoSC]
(
	@IDEnsayoMetodo int,
	@IDSolicitudCertificacion int,
	@IDSC int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [EnsayoMetodoSC]
	WHERE [IDEnsayoMetodo] = @IDEnsayoMetodo AND [IDSolicitudCertificacion] = @IDSolicitudCertificacion AND [IDSC] = @IDSC

	SET NOCOUNT OFF
END

GO
