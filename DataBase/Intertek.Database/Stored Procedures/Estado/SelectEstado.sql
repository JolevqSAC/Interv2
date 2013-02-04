IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectEstado]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectEstado]
GO

CREATE PROCEDURE [dbo].[SelectEstado]
(
	@IDEstado int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDEstado],
	[EST_Descripcion],
	[EST_Tipo],
	[EST_Estado],
	[EST_UsuarioCreacion],
	[EST_FechaHoraCreacion],
	[EST_UsuarioModificacion],
	[EST_FechaHoraModificacion]
	FROM [Estado]
	WHERE [IDEstado] = @IDEstado

	SET NOCOUNT OFF
END

GO
