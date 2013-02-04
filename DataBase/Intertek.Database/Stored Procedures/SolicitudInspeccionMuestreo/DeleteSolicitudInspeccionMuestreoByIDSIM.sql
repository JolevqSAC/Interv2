IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteSolicitudInspeccionMuestreoByIDSIM]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteSolicitudInspeccionMuestreoByIDSIM]
GO

CREATE PROCEDURE [dbo].[DeleteSolicitudInspeccionMuestreoByIDSIM]
(
	@IDSIM int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [SolicitudInspeccionMuestreo]
	WHERE [IDSIM] = @IDSIM

	SET NOCOUNT OFF
END

GO
