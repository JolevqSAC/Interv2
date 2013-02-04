IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertNormaLimite]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertNormaLimite]
GO

CREATE PROCEDURE [dbo].[InsertNormaLimite]
(
	@IDNormaLimite int OUT,
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

	INSERT INTO [NormaLimite] ([IDEnsayo], [IDMetodo], [IDNorma], [NOL_Minimo], [NOL_Maximo], [NOL_Forma]) 
	VALUES (@IDEnsayo, @IDMetodo, @IDNorma, @NOL_Minimo, @NOL_Maximo, @NOL_Forma)

	SET @IDNormaLimite = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
