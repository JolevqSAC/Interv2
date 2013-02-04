IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAnaquelByIDLaboratorio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectAnaquelByIDLaboratorio]
GO

CREATE PROCEDURE [dbo].[SelectAnaquelByIDLaboratorio]
(
	@IDLaboratorio int
)
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
	WHERE [IDLaboratorio] = @IDLaboratorio

	SET NOCOUNT OFF
END

GO
