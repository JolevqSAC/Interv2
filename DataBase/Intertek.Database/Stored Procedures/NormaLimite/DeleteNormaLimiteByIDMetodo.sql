IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteNormaLimiteByIDMetodo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteNormaLimiteByIDMetodo]
GO

CREATE PROCEDURE [dbo].[DeleteNormaLimiteByIDMetodo]
(
	@IDMetodo int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [NormaLimite]
	WHERE [IDMetodo] = @IDMetodo

	SET NOCOUNT OFF
END

GO
