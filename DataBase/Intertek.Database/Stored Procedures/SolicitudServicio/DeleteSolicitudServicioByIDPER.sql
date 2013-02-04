IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteSolicitudServicioByIDPER]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteSolicitudServicioByIDPER]
GO

CREATE PROCEDURE [dbo].[DeleteSolicitudServicioByIDPER]
(
	@IDPER int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [SolicitudServicio]
	WHERE [IDPER] = @IDPER

	SET NOCOUNT OFF
END

GO
