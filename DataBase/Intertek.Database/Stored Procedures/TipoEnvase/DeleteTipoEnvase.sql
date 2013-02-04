IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteTipoEnvase]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteTipoEnvase]
GO

CREATE PROCEDURE [dbo].[DeleteTipoEnvase]
(
	@IDTiposEnvase int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [TipoEnvase]
	WHERE [IDTiposEnvase] = @IDTiposEnvase

	SET NOCOUNT OFF
END

GO
