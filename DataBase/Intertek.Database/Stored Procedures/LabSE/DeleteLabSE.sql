IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteLabSE]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteLabSE]
GO

CREATE PROCEDURE [dbo].[DeleteLabSE]
(
	@IDLabSE int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [LabSE]
	WHERE [IDLabSE] = @IDLabSE

	SET NOCOUNT OFF
END

GO
