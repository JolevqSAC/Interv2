IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteCargo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteCargo]
GO

CREATE PROCEDURE [dbo].[DeleteCargo]
(
	@IDCargo int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Cargo]
	WHERE [IDCargo] = @IDCargo

	SET NOCOUNT OFF
END

GO
