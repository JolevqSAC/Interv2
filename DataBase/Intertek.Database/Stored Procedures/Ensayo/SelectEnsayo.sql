IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectEnsayo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectEnsayo]
GO

CREATE PROCEDURE [dbo].[SelectEnsayo]
(
	@IDEnsayo int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDEnsayo],
	[ENS_Codigo],
	[ENS_Nombre],
	[ENS_NombreIngles],
	[ENS_Estado],
	[IDLaboratorio],
	[ENS_Descripcion],
	[ENS_UsuarioCreacion],
	[ENS_FechaHoraCreacion],
	[ENS_UsuarioModificacion],
	[ENS_FechaHoraModificacion]
	FROM [Ensayo]
	WHERE [IDEnsayo] = @IDEnsayo

	SET NOCOUNT OFF
END

GO
