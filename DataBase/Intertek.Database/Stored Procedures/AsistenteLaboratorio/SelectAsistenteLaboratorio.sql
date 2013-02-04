IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAsistenteLaboratorio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAsistenteLaboratorio]
GO

CREATE PROCEDURE [dbo].[SelectAsistenteLaboratorio]
(
	@IDAsistenteLaboratorio int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDAsistenteLaboratorio],
	[IDPersonal]
	FROM [AsistenteLaboratorio]
	WHERE [IDAsistenteLaboratorio] = @IDAsistenteLaboratorio

	SET NOCOUNT OFF
END

GO
