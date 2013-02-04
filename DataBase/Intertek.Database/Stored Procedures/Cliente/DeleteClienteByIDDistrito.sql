IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteClienteByIDDistrito]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteClienteByIDDistrito]
GO

CREATE PROCEDURE [dbo].[DeleteClienteByIDDistrito]
(
	@IDDistrito int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Cliente]
	WHERE [IDDistrito] = @IDDistrito

	SET NOCOUNT OFF
END

GO
