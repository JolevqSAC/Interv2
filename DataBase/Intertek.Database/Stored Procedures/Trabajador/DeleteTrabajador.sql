IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteTrabajador]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteTrabajador]
GO

CREATE PROCEDURE [dbo].[DeleteTrabajador]
(
	@IDPersonal int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Trabajador]
	WHERE [IDPersonal] = @IDPersonal

	SET NOCOUNT OFF
END

GO
