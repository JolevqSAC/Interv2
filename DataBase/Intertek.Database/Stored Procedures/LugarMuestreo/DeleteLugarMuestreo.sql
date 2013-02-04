IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteLugarMuestreo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteLugarMuestreo]
GO

CREATE PROCEDURE [dbo].[DeleteLugarMuestreo]
(
	@IDLugarMuestreo int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [LugarMuestreo]
	WHERE [IDLugarMuestreo] = @IDLugarMuestreo

	SET NOCOUNT OFF
END

GO
