IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteImformeMuestreo]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteImformeMuestreo]
GO

CREATE PROCEDURE [dbo].[DeleteImformeMuestreo]
(
	@IDInforme int,
	@IDPER int,
	@IDIM int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [ImformeMuestreo]
	WHERE [IDInforme] = @IDInforme AND [IDPER] = @IDPER AND [IDIM] = @IDIM

	SET NOCOUNT OFF
END

GO
