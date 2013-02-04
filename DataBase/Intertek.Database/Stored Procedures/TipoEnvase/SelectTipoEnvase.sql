IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectTipoEnvase]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectTipoEnvase]
GO

CREATE PROCEDURE [dbo].[SelectTipoEnvase]
(
	@IDTiposEnvase int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDTiposEnvase],
	[TIE_Descripcion],
	[TIE_Estado],
	[TIE_UsuarioCreacion],
	[TIE_FechaHoraCreacion],
	[TIE_UsuarioModificacion],
	[TIE_FechaHoraModificacion]
	FROM [TipoEnvase]
	WHERE [IDTiposEnvase] = @IDTiposEnvase

	SET NOCOUNT OFF
END

GO
