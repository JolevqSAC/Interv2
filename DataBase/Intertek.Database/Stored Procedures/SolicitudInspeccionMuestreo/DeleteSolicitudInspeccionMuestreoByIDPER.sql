IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteSolicitudInspeccionMuestreoByIDPER]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteSolicitudInspeccionMuestreoByIDPER]
GO

CREATE PROCEDURE [dbo].[DeleteSolicitudInspeccionMuestreoByIDPER]
(
	@IDPER int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [SolicitudInspeccionMuestreo]
	WHERE [IDPER] = @IDPER

	SET NOCOUNT OFF
END

GO
