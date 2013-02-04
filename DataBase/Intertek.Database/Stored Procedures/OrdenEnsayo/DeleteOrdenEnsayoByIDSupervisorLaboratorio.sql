IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteOrdenEnsayoByIDSupervisorLaboratorio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteOrdenEnsayoByIDSupervisorLaboratorio]
GO

CREATE PROCEDURE [dbo].[DeleteOrdenEnsayoByIDSupervisorLaboratorio]
(
	@IDSupervisorLaboratorio int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [OrdenEnsayo]
	WHERE [IDSupervisorLaboratorio] = @IDSupervisorLaboratorio

	SET NOCOUNT OFF
END

GO
