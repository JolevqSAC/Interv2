IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteDistrito]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteDistrito]
GO

CREATE PROCEDURE [dbo].[DeleteDistrito]
(
	@IDDistrito int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Distrito]
	WHERE [IDDistrito] = @IDDistrito

	SET NOCOUNT OFF
END

GO
