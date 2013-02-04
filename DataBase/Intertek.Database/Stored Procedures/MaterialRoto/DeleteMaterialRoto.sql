IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteMaterialRoto]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteMaterialRoto]
GO

CREATE PROCEDURE [dbo].[DeleteMaterialRoto]
(
	@IDMaterialRoto int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [MaterialRoto]
	WHERE [IDMaterialRoto] = @IDMaterialRoto

	SET NOCOUNT OFF
END

GO
