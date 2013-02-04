IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectJefeLaboratorioByIDPersonal]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectJefeLaboratorioByIDPersonal]
GO

CREATE PROCEDURE [dbo].[SelectJefeLaboratorioByIDPersonal]
(
	@IDPersonal int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDJefeLaboratorio],
	[IDPersonal]
	FROM [JefeLaboratorio]
	WHERE [IDPersonal] = @IDPersonal

	SET NOCOUNT OFF
END

GO
