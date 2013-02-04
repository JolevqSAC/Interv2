IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAnaquel]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAnaquel]
GO

CREATE PROCEDURE [dbo].[SelectAnaquel]
(
	@IDAnaquel int
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
	WHERE [IDAnaquel] = @IDAnaquel

	SET NOCOUNT OFF
END

GO
