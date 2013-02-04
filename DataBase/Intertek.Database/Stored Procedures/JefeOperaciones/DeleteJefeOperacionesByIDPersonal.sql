IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteJefeOperacionesByIDPersonal]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteJefeOperacionesByIDPersonal]
GO

CREATE PROCEDURE [dbo].[DeleteJefeOperacionesByIDPersonal]
(
	@IDPersonal int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [JefeOperaciones]
	WHERE [IDPersonal] = @IDPersonal

	SET NOCOUNT OFF
END

GO
