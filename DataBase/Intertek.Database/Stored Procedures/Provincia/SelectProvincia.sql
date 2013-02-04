IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectProvincia]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectProvincia]
GO

CREATE PROCEDURE [dbo].[SelectProvincia]
(
	@IDProvincia int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDProvincia],
	[IDDepartamento],
	[PRO_Nombre]
	FROM [Provincia]
	WHERE [IDProvincia] = @IDProvincia

	SET NOCOUNT OFF
END

GO
