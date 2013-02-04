IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectLaboratorioByIDTipoLaboratorio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectLaboratorioByIDTipoLaboratorio]
GO

CREATE PROCEDURE [dbo].[SelectLaboratorioByIDTipoLaboratorio]
(
	@IDTipoLaboratorio int
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
	WHERE [IDTipoLaboratorio] = @IDTipoLaboratorio

	SET NOCOUNT OFF
END

GO
