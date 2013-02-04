IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertEnsayoMetodoSC]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertEnsayoMetodoSC]
GO

CREATE PROCEDURE [dbo].[InsertEnsayoMetodoSC]
(
	@IDEnsayoMetodo int OUT,
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

	INSERT INTO [EnsayoMetodoSC] ([IDSolicitudCertificacion], [IDSC], [IDEnsayo], [IDMetodo], [IDPersonal], [ESM_OficialNoOficial], [ESM_Cantidad], [ESM_Precio], [ESM_FechaInicio], [ESM_FechaFin], [ESM_Estado], [ESM_EsSS]) 
	VALUES (@IDSolicitudCertificacion, @IDSC, @IDEnsayo, @IDMetodo, @IDPersonal, @ESM_OficialNoOficial, @ESM_Cantidad, @ESM_Precio, @ESM_FechaInicio, @ESM_FechaFin, @ESM_Estado, @ESM_EsSS)

	SET @IDEnsayoMetodo = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
