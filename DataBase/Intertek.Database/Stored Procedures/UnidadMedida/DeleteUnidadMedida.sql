IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteUnidadMedida]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteUnidadMedida]
GO

CREATE PROCEDURE [dbo].[DeleteUnidadMedida]
(
	@IDUnidadMedida int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [UnidadMedida]
	WHERE [IDUnidadMedida] = @IDUnidadMedida

	SET NOCOUNT OFF
END

GO
