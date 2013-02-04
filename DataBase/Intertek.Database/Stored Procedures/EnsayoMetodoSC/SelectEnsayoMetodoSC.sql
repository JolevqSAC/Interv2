IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectEnsayoMetodoSC]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectEnsayoMetodoSC]
GO

CREATE PROCEDURE [dbo].[SelectEnsayoMetodoSC]
(
	@IDEnsayoMetodo int,
	@IDSolicitudCertificacion int,
	@IDSC int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDEnsayoMetodo],
	[IDSolicitudCertificacion],
	[IDSC],
	[IDEnsayo],
	[IDMetodo],
	[IDPersonal],
	[ESM_OficialNoOficial],
	[ESM_Cantidad],
	[ESM_Precio],
	[ESM_FechaInicio],
	[ESM_FechaFin],
	[ESM_Estado],
	[ESM_EsSS]
	FROM [EnsayoMetodoSC]
	WHERE [IDEnsayoMetodo] = @IDEnsayoMetodo AND [IDSolicitudCertificacion] = @IDSolicitudCertificacion AND [IDSC] = @IDSC

	SET NOCOUNT OFF
END

GO
