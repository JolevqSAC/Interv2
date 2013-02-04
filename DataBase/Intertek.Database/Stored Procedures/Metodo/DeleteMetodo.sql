IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteMetodo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteMetodo]
GO

CREATE PROCEDURE [dbo].[DeleteMetodo]
(
	@IDMetodo int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Metodo]
	WHERE [IDMetodo] = @IDMetodo

	SET NOCOUNT OFF
END

GO
