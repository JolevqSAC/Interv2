IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllCorrelativoCertificado]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllCorrelativoCertificado]
GO

CREATE PROCEDURE [dbo].[SelectAllCorrelativoCertificado]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDCER],
	[CCE_Numero],
	[CCE_Anio]
	FROM [CorrelativoCertificado]

	SET NOCOUNT OFF
END

GO
