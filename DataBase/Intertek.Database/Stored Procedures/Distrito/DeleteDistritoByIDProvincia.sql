IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteDistritoByIDProvincia]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteDistritoByIDProvincia]
GO

CREATE PROCEDURE [dbo].[DeleteDistritoByIDProvincia]
(
	@IDProvincia int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Distrito]
	WHERE [IDProvincia] = @IDProvincia

	SET NOCOUNT OFF
END

GO
