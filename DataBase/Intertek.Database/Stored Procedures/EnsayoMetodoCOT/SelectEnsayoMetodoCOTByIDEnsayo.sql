IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectEnsayoMetodoCOTByIDEnsayo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectEnsayoMetodoCOTByIDEnsayo]
GO

CREATE PROCEDURE [dbo].[SelectEnsayoMetodoCOTByIDEnsayo]
(
	@IDEnsayo int
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
	WHERE [IDEnsayo] = @IDEnsayo

	SET NOCOUNT OFF
END

GO
