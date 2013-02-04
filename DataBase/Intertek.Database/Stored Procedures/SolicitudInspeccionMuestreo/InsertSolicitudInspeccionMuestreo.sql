IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertSolicitudInspeccionMuestreo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertSolicitudInspeccionMuestreo]
GO

CREATE PROCEDURE [dbo].[InsertSolicitudInspeccionMuestreo]
(
	@IDSolicitudInspeccion int OUT,
	@IDPER int,
	@IDSIM int,
	@IDJefeCertificacion int,
	@IDTiposOperaciones int,
	@SOI_CantidadLote char(18),
	@SOI_FechayHora char(18),
	@SOI_Observaciones char(18),
	@SOI_CantExtraer char(18),
	@SOI_CantEmpaquesMuestrear char(18),
	@IDJefeOperaciones int
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [SolicitudInspeccionMuestreo] ([IDPER], [IDSIM], [IDJefeCertificacion], [IDTiposOperaciones], [SOI_CantidadLote], [SOI_FechayHora], [SOI_Observaciones], [SOI_CantExtraer], [SOI_CantEmpaquesMuestrear], [IDJefeOperaciones]) 
	VALUES (@IDPER, @IDSIM, @IDJefeCertificacion, @IDTiposOperaciones, @SOI_CantidadLote, @SOI_FechayHora, @SOI_Observaciones, @SOI_CantExtraer, @SOI_CantEmpaquesMuestrear, @IDJefeOperaciones)

	SET @IDSolicitudInspeccion = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
