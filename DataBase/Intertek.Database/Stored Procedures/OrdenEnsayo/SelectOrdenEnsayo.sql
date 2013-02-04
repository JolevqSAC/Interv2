IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectOrdenEnsayo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectOrdenEnsayo]
GO

CREATE PROCEDURE [dbo].[SelectOrdenEnsayo]
(
	@IDOrdenEnsayo int,
	@IDOE int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDOrdenEnsayo],
	[IDOE],
	[IDPER],
	[OE_FechaHora],
	[OE_Observaciones],
	[OE_FecHoraEntRRMB],
	[OE_FecHoraEntRRFQ],
	[OE_FecHoraEntRRFO],
	[OE_FecHoraEntRRH],
	[OE_Estado],
	[IDSupervisorLaboratorio]
	FROM [OrdenEnsayo]
	WHERE [IDOrdenEnsayo] = @IDOrdenEnsayo AND [IDOE] = @IDOE

	SET NOCOUNT OFF
END

GO
