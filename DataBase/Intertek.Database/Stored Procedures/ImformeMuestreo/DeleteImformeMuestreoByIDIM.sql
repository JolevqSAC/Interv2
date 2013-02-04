IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteImformeMuestreoByIDIM]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteImformeMuestreoByIDIM]
GO

CREATE PROCEDURE [dbo].[DeleteImformeMuestreoByIDIM]
(
	@IDIM int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [ImformeMuestreo]
	WHERE [IDIM] = @IDIM

	SET NOCOUNT OFF
END

GO
