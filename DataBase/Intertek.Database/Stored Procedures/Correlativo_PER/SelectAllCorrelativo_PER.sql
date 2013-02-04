IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllCorrelativo_PER]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllCorrelativo_PER]
GO

CREATE PROCEDURE [dbo].[SelectAllCorrelativo_PER]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDPER],
	[PER_Numero],
	[PER_Anio],
	[IDLaboratorio]
	FROM [Correlativo_PER]

	SET NOCOUNT OFF
END

GO
