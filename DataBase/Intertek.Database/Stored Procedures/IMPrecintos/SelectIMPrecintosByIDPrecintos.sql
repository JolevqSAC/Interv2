IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectIMPrecintosByIDPrecintos]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectIMPrecintosByIDPrecintos]
GO

CREATE PROCEDURE [dbo].[SelectIMPrecintosByIDPrecintos]
(
	@IDPrecintos int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDPER],
	[IDIM],
	[IDInforme],
	[IDPrecintos],
	[IMP_Fecha],
	[IMP_Tipo]
	FROM [IMPrecintos]
	WHERE [IDPrecintos] = @IDPrecintos

	SET NOCOUNT OFF
END

GO
