IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectJefeOperacionesByIDPersonal]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectJefeOperacionesByIDPersonal]
GO

CREATE PROCEDURE [dbo].[SelectJefeOperacionesByIDPersonal]
(
	@IDPersonal int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDJefeOperaciones],
	[IDPersonal]
	FROM [JefeOperaciones]
	WHERE [IDPersonal] = @IDPersonal

	SET NOCOUNT OFF
END

GO
