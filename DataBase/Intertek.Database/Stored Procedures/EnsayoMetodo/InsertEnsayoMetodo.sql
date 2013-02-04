IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertEnsayoMetodo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertEnsayoMetodo]
GO

CREATE PROCEDURE [dbo].[InsertEnsayoMetodo]
(
	@IDEnsayoMetodo int OUT,
	@IDEnsayo int,
	@IDMetodo int,
	@EME_Acreditado char(18),
	@EME_FechaAcreditado char(18),
	@EME_VersionActual char(18),
	@EME_FechaAsignacion char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [EnsayoMetodo] ([IDEnsayo], [IDMetodo], [EME_Acreditado], [EME_FechaAcreditado], [EME_VersionActual], [EME_FechaAsignacion]) 
	VALUES (@IDEnsayo, @IDMetodo, @EME_Acreditado, @EME_FechaAcreditado, @EME_VersionActual, @EME_FechaAsignacion)

	SET @IDEnsayoMetodo = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
