IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectTipoLaboratorio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectTipoLaboratorio]
GO

CREATE PROCEDURE [dbo].[SelectTipoLaboratorio]
(
	@IDTipoLaboratorio int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDTipoLaboratorio],
	[TLA_Nombre],
	[TLA_Estado],
	[TLA_UsuarioCreacion],
	[TLA_FechaHoraCreacion],
	[TLA_UsuarioModificacion],
	[TLA_FechaHoraModificacion]
	FROM [TipoLaboratorio]
	WHERE [IDTipoLaboratorio] = @IDTipoLaboratorio

	SET NOCOUNT OFF
END

GO
