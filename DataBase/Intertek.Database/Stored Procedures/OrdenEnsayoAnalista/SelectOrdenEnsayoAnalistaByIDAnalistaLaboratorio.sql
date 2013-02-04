IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectOrdenEnsayoAnalistaByIDAnalistaLaboratorio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectOrdenEnsayoAnalistaByIDAnalistaLaboratorio]
GO

CREATE PROCEDURE [dbo].[SelectOrdenEnsayoAnalistaByIDAnalistaLaboratorio]
(
	@IDAnalistaLaboratorio int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDEnsayo],
	[IDMetodo],
	[IDOE],
	[IDOrdenEnsayo],
	[IDLabSE],
	[IDAnalistaLaboratorio],
	[OEA_FechaAsignacion],
	[OEA_Observaciones],
	[OEA_FechaHoraInicio],
	[OEA_FechaHoraFin],
	[OEA_Estado]
	FROM [OrdenEnsayoAnalista]
	WHERE [IDAnalistaLaboratorio] = @IDAnalistaLaboratorio

	SET NOCOUNT OFF
END

GO
