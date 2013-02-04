IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllTipoLaboratorio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllTipoLaboratorio]
GO

CREATE PROCEDURE [dbo].[SelectAllTipoLaboratorio]

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

	SET NOCOUNT OFF
END

GO
