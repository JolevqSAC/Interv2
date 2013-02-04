IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllEstado]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllEstado]
GO

CREATE PROCEDURE [dbo].[SelectAllEstado]

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

	SET NOCOUNT OFF
END

GO
