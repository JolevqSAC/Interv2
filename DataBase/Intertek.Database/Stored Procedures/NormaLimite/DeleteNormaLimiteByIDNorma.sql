IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteNormaLimiteByIDNorma]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteNormaLimiteByIDNorma]
GO

CREATE PROCEDURE [dbo].[DeleteNormaLimiteByIDNorma]
(
	@IDNorma int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [NormaLimite]
	WHERE [IDNorma] = @IDNorma

	SET NOCOUNT OFF
END

GO
