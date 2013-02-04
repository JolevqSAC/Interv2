IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectPais]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectPais]
GO

CREATE PROCEDURE [dbo].[SelectPais]
(
	@IDPais int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDPais],
	[PAI_Nombre]
	FROM [Pais]
	WHERE [IDPais] = @IDPais

	SET NOCOUNT OFF
END

GO
