IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateAnalistaLaboratorio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateAnalistaLaboratorio]
GO

CREATE PROCEDURE [dbo].[UpdateAnalistaLaboratorio]
(
	@IDAnalistaLaboratorio int,
	@IDPersonal int
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [AnalistaLaboratorio]
	SET [IDPersonal] = @IDPersonal
	WHERE [IDAnalistaLaboratorio] = @IDAnalistaLaboratorio

	SET NOCOUNT OFF
END

GO
