IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateJefeLaboratorio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateJefeLaboratorio]
GO

CREATE PROCEDURE [dbo].[UpdateJefeLaboratorio]
(
	@IDJefeLaboratorio int,
	@IDPersonal int
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [JefeLaboratorio]
	SET [IDPersonal] = @IDPersonal
	WHERE [IDJefeLaboratorio] = @IDJefeLaboratorio

	SET NOCOUNT OFF
END

GO
