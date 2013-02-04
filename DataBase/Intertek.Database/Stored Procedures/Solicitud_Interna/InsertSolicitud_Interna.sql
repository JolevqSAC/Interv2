IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertSolicitud_Interna]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertSolicitud_Interna]
GO

CREATE PROCEDURE [dbo].[InsertSolicitud_Interna]
(
	@IDSolicitudInterna int OUT,
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

	INSERT INTO [Solicitud_Interna] ([IDPER], [IDSI], [IDComentario], [SOI_FechaEmision], [SOI_NumeroSEE], [SOI_ObservacionesSEE], [SOI_FechaEntrega], [SOI_HoraEntrega], [SOI_FechaAprobacion], [SOI_Estado]) 
	VALUES (@IDPER, @IDSI, @IDComentario, @SOI_FechaEmision, @SOI_NumeroSEE, @SOI_ObservacionesSEE, @SOI_FechaEntrega, @SOI_HoraEntrega, @SOI_FechaAprobacion, @SOI_Estado)

	SET @IDSolicitudInterna = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
