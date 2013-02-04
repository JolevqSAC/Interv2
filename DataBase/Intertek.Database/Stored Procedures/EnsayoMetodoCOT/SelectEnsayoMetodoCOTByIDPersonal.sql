IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectEnsayoMetodoCOTByIDPersonal]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectEnsayoMetodoCOTByIDPersonal]
GO

CREATE PROCEDURE [dbo].[SelectEnsayoMetodoCOTByIDPersonal]
(
	@IDPersonal int
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
	WHERE [IDPersonal] = @IDPersonal

	SET NOCOUNT OFF
END

GO
