IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateOrdenEnsayoAnalista]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateOrdenEnsayoAnalista]
GO

CREATE PROCEDURE [dbo].[UpdateOrdenEnsayoAnalista]
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

	UPDATE [OrdenEnsayoAnalista]
	SET [IDLabSE] = @IDLabSE, 
		[IDAnalistaLaboratorio] = @IDAnalistaLaboratorio, 
		[OEA_FechaAsignacion] = @OEA_FechaAsignacion, 
		[OEA_Observaciones] = @OEA_Observaciones, 
		[OEA_FechaHoraInicio] = @OEA_FechaHoraInicio, 
		[OEA_FechaHoraFin] = @OEA_FechaHoraFin, 
		[OEA_Estado] = @OEA_Estado
	WHERE [IDEnsayo] = @IDEnsayo AND [IDMetodo] = @IDMetodo AND [IDOE] = @IDOE AND [IDOrdenEnsayo] = @IDOrdenEnsayo

	SET NOCOUNT OFF
END

GO
