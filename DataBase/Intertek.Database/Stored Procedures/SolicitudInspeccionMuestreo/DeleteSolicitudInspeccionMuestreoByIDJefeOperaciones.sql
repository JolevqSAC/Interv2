IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteSolicitudInspeccionMuestreoByIDJefeOperaciones]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteSolicitudInspeccionMuestreoByIDJefeOperaciones]
GO

CREATE PROCEDURE [dbo].[DeleteSolicitudInspeccionMuestreoByIDJefeOperaciones]
(
	@IDJefeOperaciones int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [SolicitudInspeccionMuestreo]
	WHERE [IDJefeOperaciones] = @IDJefeOperaciones

	SET NOCOUNT OFF
END

GO
