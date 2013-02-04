IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAnalistaLaboratorio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAnalistaLaboratorio]
GO

CREATE PROCEDURE [dbo].[SelectAnalistaLaboratorio]
(
	@IDAnalistaLaboratorio int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDAnalistaLaboratorio],
	[IDPersonal]
	FROM [AnalistaLaboratorio]
	WHERE [IDAnalistaLaboratorio] = @IDAnalistaLaboratorio

	SET NOCOUNT OFF
END

GO
