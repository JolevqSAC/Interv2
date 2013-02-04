IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectDistritoByIDProvincia]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectDistritoByIDProvincia]
GO

CREATE PROCEDURE [dbo].[SelectDistritoByIDProvincia]
(
	@IDProvincia int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDDistrito],
	[DIS_Nombre],
	[IDProvincia]
	FROM [Distrito]
	WHERE [IDProvincia] = @IDProvincia

	SET NOCOUNT OFF
END

GO
