IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteControlSalidaReactivoByIDLabSE]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteControlSalidaReactivoByIDLabSE]
GO

CREATE PROCEDURE [dbo].[DeleteControlSalidaReactivoByIDLabSE]
(
	@IDLabSE int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [ControlSalidaReactivo]
	WHERE [IDLabSE] = @IDLabSE

	SET NOCOUNT OFF
END

GO
