IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectSubEnsayo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectSubEnsayo]
GO

CREATE PROCEDURE [dbo].[SelectSubEnsayo]
(
	@IDSubEnsayo int
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
	WHERE [IDSubEnsayo] = @IDSubEnsayo

	SET NOCOUNT OFF
END

GO
