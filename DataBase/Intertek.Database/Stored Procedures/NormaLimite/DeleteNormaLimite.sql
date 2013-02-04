IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteNormaLimite]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteNormaLimite]
GO

CREATE PROCEDURE [dbo].[DeleteNormaLimite]
(
	@IDNormaLimite int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [NormaLimite]
	WHERE [IDNormaLimite] = @IDNormaLimite

	SET NOCOUNT OFF
END

GO
