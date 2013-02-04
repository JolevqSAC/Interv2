IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectEnsayoMetodoCOT]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectEnsayoMetodoCOT]
GO

CREATE PROCEDURE [dbo].[SelectEnsayoMetodoCOT]
(
	@IDEnsayoMetodo int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDEnsayoMetodo],
	[IDEnsayo],
	[IDMetodo],
	[IDPersonal],
	[IDCOT],
	[ENM_OficialNoOficial],
	[ENM_Cantidad],
	[ENM_Precio],
	[ENM_FechaInicio],
	[ENM_FechaFin],
	[IDCotizacion],
	[ENM_EsSS]
	FROM [EnsayoMetodoCOT]
	WHERE [IDEnsayoMetodo] = @IDEnsayoMetodo

	SET NOCOUNT OFF
END

GO
