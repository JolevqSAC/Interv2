IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllJefeOperaciones]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllJefeOperaciones]
GO

CREATE PROCEDURE [dbo].[SelectAllJefeOperaciones]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDJefeOperaciones],
	[IDPersonal]
	FROM [JefeOperaciones]

	SET NOCOUNT OFF
END

GO
