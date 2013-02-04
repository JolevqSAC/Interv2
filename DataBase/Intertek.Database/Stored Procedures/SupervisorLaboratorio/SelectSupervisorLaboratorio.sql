IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectSupervisorLaboratorio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectSupervisorLaboratorio]
GO

CREATE PROCEDURE [dbo].[SelectSupervisorLaboratorio]
(
	@IDSupervisorLaboratorio int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDSupervisorLaboratorio],
	[IDPersonal]
	FROM [SupervisorLaboratorio]
	WHERE [IDSupervisorLaboratorio] = @IDSupervisorLaboratorio

	SET NOCOUNT OFF
END

GO
