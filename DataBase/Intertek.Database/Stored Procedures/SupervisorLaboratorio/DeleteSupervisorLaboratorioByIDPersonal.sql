IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteSupervisorLaboratorioByIDPersonal]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteSupervisorLaboratorioByIDPersonal]
GO

CREATE PROCEDURE [dbo].[DeleteSupervisorLaboratorioByIDPersonal]
(
	@IDPersonal int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [SupervisorLaboratorio]
	WHERE [IDPersonal] = @IDPersonal

	SET NOCOUNT OFF
END

GO
