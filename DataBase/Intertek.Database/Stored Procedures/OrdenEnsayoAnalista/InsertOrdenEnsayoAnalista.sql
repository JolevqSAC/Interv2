IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertOrdenEnsayoAnalista]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertOrdenEnsayoAnalista]
GO

CREATE PROCEDURE [dbo].[InsertOrdenEnsayoAnalista]
(
	@IDEnsayo int,
	@IDMetodo int,
	@IDOE int,
	@IDOrdenEnsayo int,
	@IDLabSE int,
	@IDAnalistaLaboratorio int,
	@OEA_FechaAsignacion char(18),
	@OEA_Observaciones char(18),
	@OEA_FechaHoraInicio char(18),
	@OEA_FechaHoraFin char(18),
	@OEA_Estado char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [OrdenEnsayoAnalista] ([IDEnsayo], [IDMetodo], [IDOE], [IDOrdenEnsayo], [IDLabSE], [IDAnalistaLaboratorio], [OEA_FechaAsignacion], [OEA_Observaciones], [OEA_FechaHoraInicio], [OEA_FechaHoraFin], [OEA_Estado]) 
	VALUES (@IDEnsayo, @IDMetodo, @IDOE, @IDOrdenEnsayo, @IDLabSE, @IDAnalistaLaboratorio, @OEA_FechaAsignacion, @OEA_Observaciones, @OEA_FechaHoraInicio, @OEA_FechaHoraFin, @OEA_Estado)

	SET NOCOUNT OFF
END

GO
