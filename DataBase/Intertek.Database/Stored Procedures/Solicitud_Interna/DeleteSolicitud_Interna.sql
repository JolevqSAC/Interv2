IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteSolicitud_Interna]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteSolicitud_Interna]
GO

CREATE PROCEDURE [dbo].[DeleteSolicitud_Interna]
(
	@IDSolicitudInterna int,
	@IDPER int,
	@IDSI int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Solicitud_Interna]
	WHERE [IDSolicitudInterna] = @IDSolicitudInterna AND [IDPER] = @IDPER AND [IDSI] = @IDSI

	SET NOCOUNT OFF
END

GO
