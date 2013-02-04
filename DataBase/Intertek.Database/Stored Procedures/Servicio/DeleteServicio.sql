IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteServicio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteServicio]
GO

CREATE PROCEDURE [dbo].[DeleteServicio]
(
	@IDServicio int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Servicio]
	WHERE [IDServicio] = @IDServicio

	SET NOCOUNT OFF
END

GO
