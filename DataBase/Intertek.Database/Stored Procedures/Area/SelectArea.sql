IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectArea]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectArea]
GO

CREATE PROCEDURE [dbo].[SelectArea]
(
	@IDArea int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDArea],
	[ARE_Codigo],
	[ARE_Nombre],
	[ARE_Descripcion],
	[ARE_Estado],
	[ARE_UsuarioCreaccion],
	[ARE_FechaHoraCreacion],
	[ARE_UsuarioModificacion],
	[ARE_FechaHoraModificacion]
	FROM [Area]
	WHERE [IDArea] = @IDArea

	SET NOCOUNT OFF
END

GO
