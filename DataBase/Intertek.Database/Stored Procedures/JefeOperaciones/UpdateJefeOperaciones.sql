IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateJefeOperaciones]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateJefeOperaciones]
GO

CREATE PROCEDURE [dbo].[UpdateJefeOperaciones]
(
	@IDJefeOperaciones int,
	@IDPersonal int
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [JefeOperaciones]
	SET [IDPersonal] = @IDPersonal
	WHERE [IDJefeOperaciones] = @IDJefeOperaciones

	SET NOCOUNT OFF
END

GO
