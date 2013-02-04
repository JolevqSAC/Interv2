IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteControlReactivos]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteControlReactivos]
GO

CREATE PROCEDURE [dbo].[DeleteControlReactivos]
(
	@IDControl int,
	@IDReactivo int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [ControlReactivos]
	WHERE [IDControl] = @IDControl AND [IDReactivo] = @IDReactivo

	SET NOCOUNT OFF
END

GO
