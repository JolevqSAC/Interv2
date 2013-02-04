IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllLaboratorio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllLaboratorio]
GO

CREATE PROCEDURE [dbo].[SelectAllLaboratorio]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDLaboratorio],
	[LAB_Nombre],
	[IDTipoLaboratorio],
	[LAB_Estado],
	[LAB_UsuarioCreacion],
	[LAB_FechaHoraCreacion],
	[LAB_UsuarioModificacion],
	[LAB_FechaHoraModificacion]
	FROM [Laboratorio]

	SET NOCOUNT OFF
END

GO
