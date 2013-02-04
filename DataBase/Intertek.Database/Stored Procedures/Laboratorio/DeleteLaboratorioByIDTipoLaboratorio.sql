IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteLaboratorioByIDTipoLaboratorio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteLaboratorioByIDTipoLaboratorio]
GO

CREATE PROCEDURE [dbo].[DeleteLaboratorioByIDTipoLaboratorio]
(
	@IDTipoLaboratorio int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Laboratorio]
	WHERE [IDTipoLaboratorio] = @IDTipoLaboratorio

	SET NOCOUNT OFF
END

GO
