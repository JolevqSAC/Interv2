IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteTrabajadorByIDCargo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteTrabajadorByIDCargo]
GO

CREATE PROCEDURE [dbo].[DeleteTrabajadorByIDCargo]
(
	@IDCargo int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Trabajador]
	WHERE [IDCargo] = @IDCargo

	SET NOCOUNT OFF
END

GO
