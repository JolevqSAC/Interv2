IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteEnsayoMetodoSCByIDMetodo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteEnsayoMetodoSCByIDMetodo]
GO

CREATE PROCEDURE [dbo].[DeleteEnsayoMetodoSCByIDMetodo]
(
	@IDMetodo int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [EnsayoMetodoSC]
	WHERE [IDMetodo] = @IDMetodo

	SET NOCOUNT OFF
END

GO
