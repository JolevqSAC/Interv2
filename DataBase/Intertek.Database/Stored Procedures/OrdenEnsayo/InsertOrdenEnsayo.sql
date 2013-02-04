IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertOrdenEnsayo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertOrdenEnsayo]
GO

CREATE PROCEDURE [dbo].[InsertOrdenEnsayo]
(
	@IDOrdenEnsayo int OUT,
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

	INSERT INTO [OrdenEnsayo] ([IDOE], [IDPER], [OE_FechaHora], [OE_Observaciones], [OE_FecHoraEntRRMB], [OE_FecHoraEntRRFQ], [OE_FecHoraEntRRFO], [OE_FecHoraEntRRH], [OE_Estado], [IDSupervisorLaboratorio]) 
	VALUES (@IDOE, @IDPER, @OE_FechaHora, @OE_Observaciones, @OE_FecHoraEntRRMB, @OE_FecHoraEntRRFQ, @OE_FecHoraEntRRFO, @OE_FecHoraEntRRH, @OE_Estado, @IDSupervisorLaboratorio)

	SET @IDOrdenEnsayo = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
