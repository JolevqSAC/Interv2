IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteMaterialRotoByIDReactivo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteMaterialRotoByIDReactivo]
GO

CREATE PROCEDURE [dbo].[DeleteMaterialRotoByIDReactivo]
(
	@IDReactivo int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [MaterialRoto]
	WHERE [IDReactivo] = @IDReactivo

	SET NOCOUNT OFF
END

GO
