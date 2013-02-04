IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateEnsayoMetodo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateEnsayoMetodo]
GO

CREATE PROCEDURE [dbo].[UpdateEnsayoMetodo]
(
	@IDEnsayoMetodo int,
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

	UPDATE [EnsayoMetodo]
	SET [IDEnsayo] = @IDEnsayo, 
		[IDMetodo] = @IDMetodo, 
		[EME_Acreditado] = @EME_Acreditado, 
		[EME_FechaAcreditado] = @EME_FechaAcreditado, 
		[EME_VersionActual] = @EME_VersionActual, 
		[EME_FechaAsignacion] = @EME_FechaAsignacion
	WHERE [IDEnsayoMetodo] = @IDEnsayoMetodo

	SET NOCOUNT OFF
END

GO
