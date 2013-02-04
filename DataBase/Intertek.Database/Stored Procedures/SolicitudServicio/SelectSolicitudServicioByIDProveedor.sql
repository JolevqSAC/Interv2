IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectSolicitudServicioByIDProveedor]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectSolicitudServicioByIDProveedor]
GO

CREATE PROCEDURE [dbo].[SelectSolicitudServicioByIDProveedor]
(
	@IDProveedor int
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
	WHERE [IDProveedor] = @IDProveedor

	SET NOCOUNT OFF
END

GO
