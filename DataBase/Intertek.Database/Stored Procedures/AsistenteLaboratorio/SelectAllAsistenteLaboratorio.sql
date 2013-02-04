IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllAsistenteLaboratorio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllAsistenteLaboratorio]
GO

CREATE PROCEDURE [dbo].[SelectAllAsistenteLaboratorio]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDAsistenteLaboratorio],
	[IDPersonal]
	FROM [AsistenteLaboratorio]

	SET NOCOUNT OFF
END

GO
