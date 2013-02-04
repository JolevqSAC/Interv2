IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateOrdenEnsayo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateOrdenEnsayo]
GO

CREATE PROCEDURE [dbo].[UpdateOrdenEnsayo]
(
	@IDOrdenEnsayo int,
	@IDOE int,
	@IDPER int,
	@OE_FechaHora char(18),
	@OE_Observaciones char(18),
	@OE_FecHoraEntRRMB char(18),
	@OE_FecHoraEntRRFQ char(18),
	@OE_FecHoraEntRRFO char(18),
	@OE_FecHoraEntRRH char(18),
	@OE_Estado char(18),
	@IDSupervisorLaboratorio int
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [OrdenEnsayo]
	SET [IDPER] = @IDPER, 
		[OE_FechaHora] = @OE_FechaHora, 
		[OE_Observaciones] = @OE_Observaciones, 
		[OE_FecHoraEntRRMB] = @OE_FecHoraEntRRMB, 
		[OE_FecHoraEntRRFQ] = @OE_FecHoraEntRRFQ, 
		[OE_FecHoraEntRRFO] = @OE_FecHoraEntRRFO, 
		[OE_FecHoraEntRRH] = @OE_FecHoraEntRRH, 
		[OE_Estado] = @OE_Estado, 
		[IDSupervisorLaboratorio] = @IDSupervisorLaboratorio
	WHERE [IDOrdenEnsayo] = @IDOrdenEnsayo AND [IDOE] = @IDOE

	SET NOCOUNT OFF
END

GO
