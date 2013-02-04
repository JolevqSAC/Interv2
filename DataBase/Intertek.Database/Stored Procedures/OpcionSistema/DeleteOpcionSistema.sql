IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteOpcionSistema]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteOpcionSistema]
GO

CREATE PROCEDURE [dbo].[DeleteOpcionSistema]
(
	@IDOpcionSistema int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [OpcionSistema]
	WHERE [IDOpcionSistema] = @IDOpcionSistema

	SET NOCOUNT OFF
END

GO
