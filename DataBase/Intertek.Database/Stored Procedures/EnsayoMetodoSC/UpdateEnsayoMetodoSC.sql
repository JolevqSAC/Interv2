IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateEnsayoMetodoSC]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateEnsayoMetodoSC]
GO

CREATE PROCEDURE [dbo].[UpdateEnsayoMetodoSC]
(
	@IDEnsayoMetodo int,
	@IDSolicitudCertificacion int,
	@IDSC int,
	@IDEnsayo int,
	@IDMetodo int,
	@IDPersonal int,
	@ESM_OficialNoOficial char(18),
	@ESM_Cantidad char(18),
	@ESM_Precio char(18),
	@ESM_FechaInicio char(18),
	@ESM_FechaFin char(18),
	@ESM_Estado char(18),
	@ESM_EsSS char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [EnsayoMetodoSC]
	SET [IDEnsayo] = @IDEnsayo, 
		[IDMetodo] = @IDMetodo, 
		[IDPersonal] = @IDPersonal, 
		[ESM_OficialNoOficial] = @ESM_OficialNoOficial, 
		[ESM_Cantidad] = @ESM_Cantidad, 
		[ESM_Precio] = @ESM_Precio, 
		[ESM_FechaInicio] = @ESM_FechaInicio, 
		[ESM_FechaFin] = @ESM_FechaFin, 
		[ESM_Estado] = @ESM_Estado, 
		[ESM_EsSS] = @ESM_EsSS
	WHERE [IDEnsayoMetodo] = @IDEnsayoMetodo AND [IDSolicitudCertificacion] = @IDSolicitudCertificacion AND [IDSC] = @IDSC

	SET NOCOUNT OFF
END

GO
