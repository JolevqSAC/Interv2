IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteJefeOperaciones]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteJefeOperaciones]
GO

CREATE PROCEDURE [dbo].[DeleteJefeOperaciones]
(
	@IDJefeOperaciones int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [JefeOperaciones]
	WHERE [IDJefeOperaciones] = @IDJefeOperaciones

	SET NOCOUNT OFF
END

GO
