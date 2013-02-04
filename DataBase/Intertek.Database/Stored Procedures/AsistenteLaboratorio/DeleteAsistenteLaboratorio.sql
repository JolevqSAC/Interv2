IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteAsistenteLaboratorio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteAsistenteLaboratorio]
GO

CREATE PROCEDURE [dbo].[DeleteAsistenteLaboratorio]
(
	@IDAsistenteLaboratorio int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [AsistenteLaboratorio]
	WHERE [IDAsistenteLaboratorio] = @IDAsistenteLaboratorio

	SET NOCOUNT OFF
END

GO
