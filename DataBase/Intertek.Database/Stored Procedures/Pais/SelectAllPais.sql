IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllPais]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllPais]
GO

CREATE PROCEDURE [dbo].[SelectAllPais]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDPais],
	[PAI_Nombre]
	FROM [Pais]

	SET NOCOUNT OFF
END

GO
