IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllAnalistaLaboratorio]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllAnalistaLaboratorio]
GO

CREATE PROCEDURE [dbo].[SelectAllAnalistaLaboratorio]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDAnalistaLaboratorio],
	[IDPersonal]
	FROM [AnalistaLaboratorio]

	SET NOCOUNT OFF
END

GO
