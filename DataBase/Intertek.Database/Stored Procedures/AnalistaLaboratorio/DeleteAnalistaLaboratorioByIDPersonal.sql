IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteAnalistaLaboratorioByIDPersonal]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteAnalistaLaboratorioByIDPersonal]
GO

CREATE PROCEDURE [dbo].[DeleteAnalistaLaboratorioByIDPersonal]
(
	@IDPersonal int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [AnalistaLaboratorio]
	WHERE [IDPersonal] = @IDPersonal

	SET NOCOUNT OFF
END

GO
