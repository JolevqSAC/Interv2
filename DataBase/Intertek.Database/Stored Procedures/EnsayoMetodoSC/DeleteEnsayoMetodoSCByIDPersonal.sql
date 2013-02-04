IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteEnsayoMetodoSCByIDPersonal]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteEnsayoMetodoSCByIDPersonal]
GO

CREATE PROCEDURE [dbo].[DeleteEnsayoMetodoSCByIDPersonal]
(
	@IDPersonal int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [EnsayoMetodoSC]
	WHERE [IDPersonal] = @IDPersonal

	SET NOCOUNT OFF
END

GO
