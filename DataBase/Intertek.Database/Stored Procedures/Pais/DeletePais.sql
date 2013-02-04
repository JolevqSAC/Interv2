IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeletePais]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeletePais]
GO

CREATE PROCEDURE [dbo].[DeletePais]
(
	@IDPais int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Pais]
	WHERE [IDPais] = @IDPais

	SET NOCOUNT OFF
END

GO
