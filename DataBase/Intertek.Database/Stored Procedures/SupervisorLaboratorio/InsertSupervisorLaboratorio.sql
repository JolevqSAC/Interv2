IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertSupervisorLaboratorio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertSupervisorLaboratorio]
GO

CREATE PROCEDURE [dbo].[InsertSupervisorLaboratorio]
(
	@IDSupervisorLaboratorio int OUT,
	@IDPersonal int
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [SupervisorLaboratorio] ([IDPersonal]) 
	VALUES (@IDPersonal)

	SET @IDSupervisorLaboratorio = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
