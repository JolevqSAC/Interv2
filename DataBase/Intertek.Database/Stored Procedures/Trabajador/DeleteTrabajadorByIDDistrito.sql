IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteTrabajadorByIDDistrito]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteTrabajadorByIDDistrito]
GO

CREATE PROCEDURE [dbo].[DeleteTrabajadorByIDDistrito]
(
	@IDDistrito int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Trabajador]
	WHERE [IDDistrito] = @IDDistrito

	SET NOCOUNT OFF
END

GO
