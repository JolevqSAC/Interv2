IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteCentroCosto]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteCentroCosto]
GO

CREATE PROCEDURE [dbo].[DeleteCentroCosto]
(
	@IDCentroCosto int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [CentroCosto]
	WHERE [IDCentroCosto] = @IDCentroCosto

	SET NOCOUNT OFF
END

GO
