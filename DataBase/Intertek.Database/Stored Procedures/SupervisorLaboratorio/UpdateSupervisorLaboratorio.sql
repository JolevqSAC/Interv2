IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateSupervisorLaboratorio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateSupervisorLaboratorio]
GO

CREATE PROCEDURE [dbo].[UpdateSupervisorLaboratorio]
(
	@IDSupervisorLaboratorio int,
	@IDPersonal int
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [SupervisorLaboratorio]
	SET [IDPersonal] = @IDPersonal
	WHERE [IDSupervisorLaboratorio] = @IDSupervisorLaboratorio

	SET NOCOUNT OFF
END

GO
