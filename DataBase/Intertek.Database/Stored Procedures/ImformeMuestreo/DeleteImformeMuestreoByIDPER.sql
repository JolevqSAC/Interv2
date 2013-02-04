IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteImformeMuestreoByIDPER]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteImformeMuestreoByIDPER]
GO

CREATE PROCEDURE [dbo].[DeleteImformeMuestreoByIDPER]
(
	@IDPER int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [ImformeMuestreo]
	WHERE [IDPER] = @IDPER

	SET NOCOUNT OFF
END

GO
