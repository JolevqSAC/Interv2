IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteJefeLaboratorio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteJefeLaboratorio]
GO

CREATE PROCEDURE [dbo].[DeleteJefeLaboratorio]
(
	@IDJefeLaboratorio int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [JefeLaboratorio]
	WHERE [IDJefeLaboratorio] = @IDJefeLaboratorio

	SET NOCOUNT OFF
END

GO
