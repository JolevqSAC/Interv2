IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectSolicitudServicioByIDPER]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectSolicitudServicioByIDPER]
GO

CREATE PROCEDURE [dbo].[SelectSolicitudServicioByIDPER]
(
	@IDPER int
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
	WHERE [IDPER] = @IDPER

	SET NOCOUNT OFF
END

GO
