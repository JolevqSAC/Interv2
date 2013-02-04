IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAsistenteLaboratorioByIDPersonal]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectAsistenteLaboratorioByIDPersonal]
GO

CREATE PROCEDURE [dbo].[SelectAsistenteLaboratorioByIDPersonal]
(
	@IDPersonal int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDAsistenteLaboratorio],
	[IDPersonal]
	FROM [AsistenteLaboratorio]
	WHERE [IDPersonal] = @IDPersonal

	SET NOCOUNT OFF
END

GO
