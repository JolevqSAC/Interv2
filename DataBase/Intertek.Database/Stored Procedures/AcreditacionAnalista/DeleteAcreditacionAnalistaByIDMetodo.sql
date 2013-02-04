IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteAcreditacionAnalistaByIDMetodo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteAcreditacionAnalistaByIDMetodo]
GO

CREATE PROCEDURE [dbo].[DeleteAcreditacionAnalistaByIDMetodo]
(
	@IDMetodo int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [AcreditacionAnalista]
	WHERE [IDMetodo] = @IDMetodo

	SET NOCOUNT OFF
END

GO
