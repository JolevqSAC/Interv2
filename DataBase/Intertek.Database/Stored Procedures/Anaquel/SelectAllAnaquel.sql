IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllAnaquel]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllAnaquel]
GO

CREATE PROCEDURE [dbo].[SelectAllAnaquel]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDAnaquel],
	[IDLaboratorio],
	[ANA_Nombre],
	[ANA_Descripcion],
	[ANA_Capacidad],
	[ANA_Estado],
	[ANA_UsuarioCreacion],
	[ANA_FechaHoraCreacion],
	[ANA_UsuarioModificacion],
	[ANA_FechaHoraModificacion]
	FROM [Anaquel]

	SET NOCOUNT OFF
END

GO
