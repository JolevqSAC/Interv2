IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectEnsayoByIDLaboratorio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectEnsayoByIDLaboratorio]
GO

CREATE PROCEDURE [dbo].[SelectEnsayoByIDLaboratorio]
(
	@IDLaboratorio int
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
	WHERE [IDLaboratorio] = @IDLaboratorio

	SET NOCOUNT OFF
END

GO
