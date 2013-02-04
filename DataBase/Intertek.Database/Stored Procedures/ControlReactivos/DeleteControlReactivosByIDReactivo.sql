IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteControlReactivosByIDReactivo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteControlReactivosByIDReactivo]
GO

CREATE PROCEDURE [dbo].[DeleteControlReactivosByIDReactivo]
(
	@IDReactivo int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [ControlReactivos]
	WHERE [IDReactivo] = @IDReactivo

	SET NOCOUNT OFF
END

GO
