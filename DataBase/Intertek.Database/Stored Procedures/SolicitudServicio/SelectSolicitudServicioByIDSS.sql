IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectSolicitudServicioByIDSS]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectSolicitudServicioByIDSS]
GO

CREATE PROCEDURE [dbo].[SelectSolicitudServicioByIDSS]
(
	@IDSS int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDSolicitudServicio],
	[IDSS],
	[IDComentario],
	[IDPER],
	[IDProveedor],
	[SOS_Fecha]
	FROM [SolicitudServicio]
	WHERE [IDSS] = @IDSS

	SET NOCOUNT OFF
END

GO
