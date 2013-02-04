IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllEnsayoMetodoCOT]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllEnsayoMetodoCOT]
GO

CREATE PROCEDURE [dbo].[SelectAllEnsayoMetodoCOT]

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

	SET NOCOUNT OFF
END

GO
