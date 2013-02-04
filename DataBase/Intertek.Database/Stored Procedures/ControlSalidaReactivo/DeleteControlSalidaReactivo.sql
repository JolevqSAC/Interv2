IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteControlSalidaReactivo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteControlSalidaReactivo]
GO

CREATE PROCEDURE [dbo].[DeleteControlSalidaReactivo]
(
	@IDControlSalidaReactivo int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [ControlSalidaReactivo]
	WHERE [IDControlSalidaReactivo] = @IDControlSalidaReactivo

	SET NOCOUNT OFF
END

GO
