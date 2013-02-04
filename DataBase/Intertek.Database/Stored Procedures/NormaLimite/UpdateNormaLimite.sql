IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateNormaLimite]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateNormaLimite]
GO

CREATE PROCEDURE [dbo].[UpdateNormaLimite]
(
	@IDNormaLimite int,
	@IDEnsayo int,
	@IDMetodo int,
	@IDNorma int,
	@NOL_Minimo char(18),
	@NOL_Maximo char(18),
	@NOL_Forma char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [NormaLimite]
	SET [IDEnsayo] = @IDEnsayo, 
		[IDMetodo] = @IDMetodo, 
		[IDNorma] = @IDNorma, 
		[NOL_Minimo] = @NOL_Minimo, 
		[NOL_Maximo] = @NOL_Maximo, 
		[NOL_Forma] = @NOL_Forma
	WHERE [IDNormaLimite] = @IDNormaLimite

	SET NOCOUNT OFF
END

GO
