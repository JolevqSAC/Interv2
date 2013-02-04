IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectSubEnsayoByIDEnsayo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectSubEnsayoByIDEnsayo]
GO

CREATE PROCEDURE [dbo].[SelectSubEnsayoByIDEnsayo]
(
	@IDEnsayo int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDSubEnsayo],
	[SEN_Codigo],
	[SEN_Nombre],
	[SEN_NombreIngles],
	[IDEnsayo],
	[SEN_Estado],
	[SEN_UsuarioCreacion],
	[SEN_FechaHoraCreacion],
	[SEN_UsuarioModificacion],
	[SEN_FechaHoraModificacion]
	FROM [SubEnsayo]
	WHERE [IDEnsayo] = @IDEnsayo

	SET NOCOUNT OFF
END

GO
