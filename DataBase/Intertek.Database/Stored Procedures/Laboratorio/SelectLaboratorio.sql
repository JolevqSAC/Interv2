IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectLaboratorio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectLaboratorio]
GO

CREATE PROCEDURE [dbo].[SelectLaboratorio]
(
	@IDLaboratorio int
)
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
	WHERE [IDLaboratorio] = @IDLaboratorio

	SET NOCOUNT OFF
END

GO
