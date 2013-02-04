IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteSupervisorLaboratorio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteSupervisorLaboratorio]
GO

CREATE PROCEDURE [dbo].[DeleteSupervisorLaboratorio]
(
	@IDSupervisorLaboratorio int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [SupervisorLaboratorio]
	WHERE [IDSupervisorLaboratorio] = @IDSupervisorLaboratorio

	SET NOCOUNT OFF
END

GO
