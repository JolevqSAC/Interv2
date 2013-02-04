IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteEstado]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteEstado]
GO

CREATE PROCEDURE [dbo].[DeleteEstado]
(
	@IDEstado int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Estado]
	WHERE [IDEstado] = @IDEstado

	SET NOCOUNT OFF
END

GO
