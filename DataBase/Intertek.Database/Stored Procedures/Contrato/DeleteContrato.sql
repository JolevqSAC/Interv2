IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteContrato]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteContrato]
GO

CREATE PROCEDURE [dbo].[DeleteContrato]
(
	@IDContrato int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [Contrato]
	WHERE [IDContrato] = @IDContrato

	SET NOCOUNT OFF
END

GO
