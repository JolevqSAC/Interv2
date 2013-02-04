IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectCorrelativoCertificado]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectCorrelativoCertificado]
GO

CREATE PROCEDURE [dbo].[SelectCorrelativoCertificado]
(
	@IDCER int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDCER],
	[CCE_Numero],
	[CCE_Anio]
	FROM [CorrelativoCertificado]
	WHERE [IDCER] = @IDCER

	SET NOCOUNT OFF
END

GO
