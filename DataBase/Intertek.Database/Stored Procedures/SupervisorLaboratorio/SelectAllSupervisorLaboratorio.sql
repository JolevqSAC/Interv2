IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllSupervisorLaboratorio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllSupervisorLaboratorio]
GO

CREATE PROCEDURE [dbo].[SelectAllSupervisorLaboratorio]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDSupervisorLaboratorio],
	[IDPersonal]
	FROM [SupervisorLaboratorio]

	SET NOCOUNT OFF
END

GO
