IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllSubEnsayo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllSubEnsayo]
GO

CREATE PROCEDURE [dbo].[SelectAllSubEnsayo]

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

	SET NOCOUNT OFF
END

GO
