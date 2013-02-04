IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectOrdenEnsayoAnalistaByIDMetodo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectOrdenEnsayoAnalistaByIDMetodo]
GO

CREATE PROCEDURE [dbo].[SelectOrdenEnsayoAnalistaByIDMetodo]
(
	@IDMetodo int
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
	WHERE [IDMetodo] = @IDMetodo

	SET NOCOUNT OFF
END

GO
