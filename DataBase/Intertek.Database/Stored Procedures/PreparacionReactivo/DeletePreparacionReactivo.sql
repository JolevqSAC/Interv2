IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeletePreparacionReactivo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeletePreparacionReactivo]
GO

CREATE PROCEDURE [dbo].[DeletePreparacionReactivo]
(
	@IDPreparacionReactivo int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [PreparacionReactivo]
	WHERE [IDPreparacionReactivo] = @IDPreparacionReactivo

	SET NOCOUNT OFF
END

GO
