IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteSolicitudInspeccionMuestreo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteSolicitudInspeccionMuestreo]
GO

CREATE PROCEDURE [dbo].[DeleteSolicitudInspeccionMuestreo]
(
	@IDSolicitudInspeccion int,
	@IDPER int,
	@IDSIM int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [SolicitudInspeccionMuestreo]
	WHERE [IDSolicitudInspeccion] = @IDSolicitudInspeccion AND [IDPER] = @IDPER AND [IDSIM] = @IDSIM

	SET NOCOUNT OFF
END

GO
