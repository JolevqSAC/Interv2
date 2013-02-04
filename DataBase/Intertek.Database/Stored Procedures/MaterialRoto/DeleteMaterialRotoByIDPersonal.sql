IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteMaterialRotoByIDPersonal]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteMaterialRotoByIDPersonal]
GO

CREATE PROCEDURE [dbo].[DeleteMaterialRotoByIDPersonal]
(
	@IDPersonal int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [MaterialRoto]
	WHERE [IDPersonal] = @IDPersonal

	SET NOCOUNT OFF
END

GO
