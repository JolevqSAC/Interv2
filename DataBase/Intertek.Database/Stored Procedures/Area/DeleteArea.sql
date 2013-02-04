IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteArea]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteArea]
GO

CREATE PROCEDURE [dbo].[DeleteArea]
(
	@IDArea int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Area]
	WHERE [IDArea] = @IDArea

	SET NOCOUNT OFF
END

GO
