IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllTipoEnvase]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllTipoEnvase]
GO

CREATE PROCEDURE [dbo].[SelectAllTipoEnvase]

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

	SET NOCOUNT OFF
END

GO
