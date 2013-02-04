IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectCorrelativo_PER]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectCorrelativo_PER]
GO

CREATE PROCEDURE [dbo].[SelectCorrelativo_PER]
(
	@IDPER int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDPER],
	[PER_Numero],
	[PER_Anio],
	[IDLaboratorio]
	FROM [Correlativo_PER]
	WHERE [IDPER] = @IDPER

	SET NOCOUNT OFF
END

GO
