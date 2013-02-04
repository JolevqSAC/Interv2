IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteRolOpcionSistemaByIDOpcionSistema]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteRolOpcionSistemaByIDOpcionSistema]
GO

CREATE PROCEDURE [dbo].[DeleteRolOpcionSistemaByIDOpcionSistema]
(
	@IDOpcionSistema int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [RolOpcionSistema]
	WHERE [IDOpcionSistema] = @IDOpcionSistema

	SET NOCOUNT OFF
END

GO
