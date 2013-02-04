IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteEnsayoMetodoCOTByIDPersonal]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteEnsayoMetodoCOTByIDPersonal]
GO

CREATE PROCEDURE [dbo].[DeleteEnsayoMetodoCOTByIDPersonal]
(
	@IDPersonal int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [EnsayoMetodoCOT]
	WHERE [IDPersonal] = @IDPersonal

	SET NOCOUNT OFF
END

GO
