IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectOrdenEnsayoAnalista]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectOrdenEnsayoAnalista]
GO

CREATE PROCEDURE [dbo].[SelectOrdenEnsayoAnalista]
(
	@IDEnsayo int,
	@IDMetodo int,
	@IDOE int,
	@IDOrdenEnsayo int
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
	WHERE [IDEnsayo] = @IDEnsayo AND [IDMetodo] = @IDMetodo AND [IDOE] = @IDOE AND [IDOrdenEnsayo] = @IDOrdenEnsayo

	SET NOCOUNT OFF
END

GO
