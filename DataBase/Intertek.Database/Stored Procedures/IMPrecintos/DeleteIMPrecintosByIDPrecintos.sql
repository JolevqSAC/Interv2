IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteIMPrecintosByIDPrecintos]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteIMPrecintosByIDPrecintos]
GO

CREATE PROCEDURE [dbo].[DeleteIMPrecintosByIDPrecintos]
(
	@IDPrecintos int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [IMPrecintos]
	WHERE [IDPrecintos] = @IDPrecintos

	SET NOCOUNT OFF
END

GO
