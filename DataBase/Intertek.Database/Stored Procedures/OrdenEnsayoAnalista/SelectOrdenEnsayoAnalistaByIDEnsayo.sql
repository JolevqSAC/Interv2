IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectOrdenEnsayoAnalistaByIDEnsayo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectOrdenEnsayoAnalistaByIDEnsayo]
GO

CREATE PROCEDURE [dbo].[SelectOrdenEnsayoAnalistaByIDEnsayo]
(
	@IDEnsayo int
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
	WHERE [IDEnsayo] = @IDEnsayo

	SET NOCOUNT OFF
END

GO
