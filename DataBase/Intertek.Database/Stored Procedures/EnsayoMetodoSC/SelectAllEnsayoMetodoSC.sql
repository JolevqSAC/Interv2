IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllEnsayoMetodoSC]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllEnsayoMetodoSC]
GO

CREATE PROCEDURE [dbo].[SelectAllEnsayoMetodoSC]

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

	SET NOCOUNT OFF
END

GO
