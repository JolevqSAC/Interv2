IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateAsistenteLaboratorio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateAsistenteLaboratorio]
GO

CREATE PROCEDURE [dbo].[UpdateAsistenteLaboratorio]
(
	@IDAsistenteLaboratorio int,
	@IDPersonal int
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [AsistenteLaboratorio]
	SET [IDPersonal] = @IDPersonal
	WHERE [IDAsistenteLaboratorio] = @IDAsistenteLaboratorio

	SET NOCOUNT OFF
END

GO
