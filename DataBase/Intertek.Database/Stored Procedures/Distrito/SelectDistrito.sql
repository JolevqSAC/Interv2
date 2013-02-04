IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectDistrito]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectDistrito]
GO

CREATE PROCEDURE [dbo].[SelectDistrito]
(
	@IDDistrito int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDDistrito],
	[DIS_Nombre],
	[IDProvincia]
	FROM [Distrito]
	WHERE [IDDistrito] = @IDDistrito

	SET NOCOUNT OFF
END

GO
