IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectEnsayoMetodoCOTByIDCotizacionAndIDCOT]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectEnsayoMetodoCOTByIDCotizacionAndIDCOT]
GO

CREATE PROCEDURE [dbo].[SelectEnsayoMetodoCOTByIDCotizacionAndIDCOT]
(
	@IDCotizacion int,
	@IDCOT int
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
	WHERE [IDCotizacion] = @IDCotizacion AND [IDCOT] = @IDCOT

	SET NOCOUNT OFF
END

GO
