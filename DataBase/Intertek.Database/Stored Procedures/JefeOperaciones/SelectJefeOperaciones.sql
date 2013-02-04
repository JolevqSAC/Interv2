IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectJefeOperaciones]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectJefeOperaciones]
GO

CREATE PROCEDURE [dbo].[SelectJefeOperaciones]
(
	@IDJefeOperaciones int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDJefeOperaciones],
	[IDPersonal]
	FROM [JefeOperaciones]
	WHERE [IDJefeOperaciones] = @IDJefeOperaciones

	SET NOCOUNT OFF
END

GO
