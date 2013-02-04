IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteRolOpcionSistema]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteRolOpcionSistema]
GO

CREATE PROCEDURE [dbo].[DeleteRolOpcionSistema]
(
	@IDRolOpcionSistema int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [RolOpcionSistema]
	WHERE [IDRolOpcionSistema] = @IDRolOpcionSistema

	SET NOCOUNT OFF
END

GO
