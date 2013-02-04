IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllOrdenEnsayo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllOrdenEnsayo]
GO

CREATE PROCEDURE [dbo].[SelectAllOrdenEnsayo]

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

	SET NOCOUNT OFF
END

GO
