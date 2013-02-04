IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteControlSalidaReactivoByIDPersonal]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteControlSalidaReactivoByIDPersonal]
GO

CREATE PROCEDURE [dbo].[DeleteControlSalidaReactivoByIDPersonal]
(
	@IDPersonal int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [ControlSalidaReactivo]
	WHERE [IDPersonal] = @IDPersonal

	SET NOCOUNT OFF
END

GO
