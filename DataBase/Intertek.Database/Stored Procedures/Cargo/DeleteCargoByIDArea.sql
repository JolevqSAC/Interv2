IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteCargoByIDArea]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteCargoByIDArea]
GO

CREATE PROCEDURE [dbo].[DeleteCargoByIDArea]
(
	@IDArea int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Cargo]
	WHERE [IDArea] = @IDArea

	SET NOCOUNT OFF
END

GO
