IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteProvincia]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteProvincia]
GO

CREATE PROCEDURE [dbo].[DeleteProvincia]
(
	@IDProvincia int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Provincia]
	WHERE [IDProvincia] = @IDProvincia

	SET NOCOUNT OFF
END

GO
