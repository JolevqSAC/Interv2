IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteRolOpcionSistemaByIDRol]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteRolOpcionSistemaByIDRol]
GO

CREATE PROCEDURE [dbo].[DeleteRolOpcionSistemaByIDRol]
(
	@IDRol int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [RolOpcionSistema]
	WHERE [IDRol] = @IDRol

	SET NOCOUNT OFF
END

GO
