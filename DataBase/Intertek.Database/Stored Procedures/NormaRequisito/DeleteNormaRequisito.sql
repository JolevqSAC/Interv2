IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteNormaRequisito]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteNormaRequisito]
GO

CREATE PROCEDURE [dbo].[DeleteNormaRequisito]
(
	@IDNormaRequisito int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [NormaRequisito]
	WHERE [IDNormaRequisito] = @IDNormaRequisito

	SET NOCOUNT OFF
END

GO
