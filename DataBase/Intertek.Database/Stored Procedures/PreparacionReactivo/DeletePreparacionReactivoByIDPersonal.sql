IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeletePreparacionReactivoByIDPersonal]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeletePreparacionReactivoByIDPersonal]
GO

CREATE PROCEDURE [dbo].[DeletePreparacionReactivoByIDPersonal]
(
	@IDPersonal int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [PreparacionReactivo]
	WHERE [IDPersonal] = @IDPersonal

	SET NOCOUNT OFF
END

GO
