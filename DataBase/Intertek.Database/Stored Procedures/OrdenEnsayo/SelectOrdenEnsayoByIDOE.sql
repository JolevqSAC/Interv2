IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectOrdenEnsayoByIDOE]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectOrdenEnsayoByIDOE]
GO

CREATE PROCEDURE [dbo].[SelectOrdenEnsayoByIDOE]
(
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
	WHERE [IDOE] = @IDOE

	SET NOCOUNT OFF
END

GO
