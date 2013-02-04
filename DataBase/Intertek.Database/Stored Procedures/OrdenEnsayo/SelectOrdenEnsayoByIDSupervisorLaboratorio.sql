IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectOrdenEnsayoByIDSupervisorLaboratorio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectOrdenEnsayoByIDSupervisorLaboratorio]
GO

CREATE PROCEDURE [dbo].[SelectOrdenEnsayoByIDSupervisorLaboratorio]
(
	@IDSupervisorLaboratorio int
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
	WHERE [IDSupervisorLaboratorio] = @IDSupervisorLaboratorio

	SET NOCOUNT OFF
END

GO
