IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteRol]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteRol]
GO

CREATE PROCEDURE [dbo].[DeleteRol]
(
	@IDRol int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Rol]
	WHERE [IDRol] = @IDRol

	SET NOCOUNT OFF
END

GO
