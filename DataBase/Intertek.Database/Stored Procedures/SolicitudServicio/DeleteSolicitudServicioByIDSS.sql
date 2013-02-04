IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteSolicitudServicioByIDSS]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteSolicitudServicioByIDSS]
GO

CREATE PROCEDURE [dbo].[DeleteSolicitudServicioByIDSS]
(
	@IDSS int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [SolicitudServicio]
	WHERE [IDSS] = @IDSS

	SET NOCOUNT OFF
END

GO
