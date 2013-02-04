IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectOrdenEnsayoAnalistaByIDOrdenEnsayoAndIDOE]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectOrdenEnsayoAnalistaByIDOrdenEnsayoAndIDOE]
GO

CREATE PROCEDURE [dbo].[SelectOrdenEnsayoAnalistaByIDOrdenEnsayoAndIDOE]
(
	@IDOrdenEnsayo int,
	@IDOE int
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
	WHERE [IDOrdenEnsayo] = @IDOrdenEnsayo AND [IDOE] = @IDOE

	SET NOCOUNT OFF
END

GO
