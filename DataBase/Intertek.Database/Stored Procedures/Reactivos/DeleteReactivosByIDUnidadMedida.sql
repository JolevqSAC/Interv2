IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteReactivosByIDUnidadMedida]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteReactivosByIDUnidadMedida]
GO

CREATE PROCEDURE [dbo].[DeleteReactivosByIDUnidadMedida]
(
	@IDUnidadMedida int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Reactivos]
	WHERE [IDUnidadMedida] = @IDUnidadMedida

	SET NOCOUNT OFF
END

GO
