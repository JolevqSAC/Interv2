IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateSolicitud_Interna]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateSolicitud_Interna]
GO

CREATE PROCEDURE [dbo].[UpdateSolicitud_Interna]
(
	@IDSolicitudInterna int,
	@IDPER int,
	@IDSI int,
	@IDComentario int,
	@SOI_FechaEmision char(18),
	@SOI_NumeroSEE char(18),
	@SOI_ObservacionesSEE char(18),
	@SOI_FechaEntrega char(18),
	@SOI_HoraEntrega char(18),
	@SOI_FechaAprobacion char(18),
	@SOI_Estado char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [Solicitud_Interna]
	SET [IDComentario] = @IDComentario, 
		[SOI_FechaEmision] = @SOI_FechaEmision, 
		[SOI_NumeroSEE] = @SOI_NumeroSEE, 
		[SOI_ObservacionesSEE] = @SOI_ObservacionesSEE, 
		[SOI_FechaEntrega] = @SOI_FechaEntrega, 
		[SOI_HoraEntrega] = @SOI_HoraEntrega, 
		[SOI_FechaAprobacion] = @SOI_FechaAprobacion, 
		[SOI_Estado] = @SOI_Estado
	WHERE [IDSolicitudInterna] = @IDSolicitudInterna AND [IDPER] = @IDPER AND [IDSI] = @IDSI

	SET NOCOUNT OFF
END

GO
