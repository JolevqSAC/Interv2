IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteControlSalidaReactivoByIDReactivo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteControlSalidaReactivoByIDReactivo]
GO

CREATE PROCEDURE [dbo].[DeleteControlSalidaReactivoByIDReactivo]
(
	@IDReactivo int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [ControlSalidaReactivo]
	WHERE [IDReactivo] = @IDReactivo

	SET NOCOUNT OFF
END

GO
