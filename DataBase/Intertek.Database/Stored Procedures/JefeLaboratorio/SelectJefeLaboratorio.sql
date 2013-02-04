IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectJefeLaboratorio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectJefeLaboratorio]
GO

CREATE PROCEDURE [dbo].[SelectJefeLaboratorio]
(
	@IDJefeLaboratorio int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDJefeLaboratorio],
	[IDPersonal]
	FROM [JefeLaboratorio]
	WHERE [IDJefeLaboratorio] = @IDJefeLaboratorio

	SET NOCOUNT OFF
END

GO
