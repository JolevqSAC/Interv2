IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectOrdenEnsayoAnalistaByIDLabSE]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectOrdenEnsayoAnalistaByIDLabSE]
GO

CREATE PROCEDURE [dbo].[SelectOrdenEnsayoAnalistaByIDLabSE]
(
	@IDLabSE int
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
	WHERE [IDLabSE] = @IDLabSE

	SET NOCOUNT OFF
END

GO
