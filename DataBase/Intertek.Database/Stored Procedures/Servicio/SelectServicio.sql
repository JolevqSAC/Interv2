IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectServicio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectServicio]
GO

CREATE PROCEDURE [dbo].[SelectServicio]
(
	@IDServicio int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDServicio],
	[SER_Codigo],
	[SER_Nombre],
	[SER_NombreIngles],
	[SER_Descripcion],
	[SER_Estado],
	[SER_UsuarioCreacion],
	[SER_FechaHoraCreacion],
	[SER_UsuarioModificacion],
	[SER_FechaHoraModificacion]
	FROM [Servicio]
	WHERE [IDServicio] = @IDServicio

	SET NOCOUNT OFF
END

GO
