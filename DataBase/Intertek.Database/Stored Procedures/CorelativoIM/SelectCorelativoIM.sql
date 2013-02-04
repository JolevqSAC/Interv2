IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectCorelativoIM]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectCorelativoIM]
GO

CREATE PROCEDURE [dbo].[SelectCorelativoIM]
(
	@IDIM int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDIM],
	[IM_Numero],
	[IM_Anio]
	FROM [CorelativoIM]
	WHERE [IDIM] = @IDIM

	SET NOCOUNT OFF
END

GO
