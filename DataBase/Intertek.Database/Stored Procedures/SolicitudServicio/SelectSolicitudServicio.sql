IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectSolicitudServicio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectSolicitudServicio]
GO

CREATE PROCEDURE [dbo].[SelectSolicitudServicio]
(
	@IDSolicitudServicio int,
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
	WHERE [IDSolicitudServicio] = @IDSolicitudServicio AND [IDSS] = @IDSS

	SET NOCOUNT OFF
END

GO
