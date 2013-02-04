IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectCorrelativo_Precintos]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectCorrelativo_Precintos]
GO

CREATE PROCEDURE [dbo].[SelectCorrelativo_Precintos]
(
	@IDPrecintos int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDPrecintos],
	[PRE_Numero],
	[PRE_Anio]
	FROM [Correlativo_Precintos]
	WHERE [IDPrecintos] = @IDPrecintos

	SET NOCOUNT OFF
END

GO
