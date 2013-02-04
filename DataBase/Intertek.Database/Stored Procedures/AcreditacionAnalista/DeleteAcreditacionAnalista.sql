IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteAcreditacionAnalista]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteAcreditacionAnalista]
GO

CREATE PROCEDURE [dbo].[DeleteAcreditacionAnalista]
(
	@IDAcreditacionAnalista int,
	@IDEnsayo int,
	@IDMetodo int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [AcreditacionAnalista]
	WHERE [IDAcreditacionAnalista] = @IDAcreditacionAnalista AND [IDEnsayo] = @IDEnsayo AND [IDMetodo] = @IDMetodo

	SET NOCOUNT OFF
END

GO
