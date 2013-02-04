IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteJefeLaboratorioByIDPersonal]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteJefeLaboratorioByIDPersonal]
GO

CREATE PROCEDURE [dbo].[DeleteJefeLaboratorioByIDPersonal]
(
	@IDPersonal int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [JefeLaboratorio]
	WHERE [IDPersonal] = @IDPersonal

	SET NOCOUNT OFF
END

GO
