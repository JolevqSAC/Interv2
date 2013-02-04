IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectAllJefeCertificacion]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectAllJefeCertificacion]
GO

CREATE PROCEDURE [dbo].[SelectAllJefeCertificacion]

AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDJefeCertificacion],
	[IDPersonal]
	FROM [JefeCertificacion]

	SET NOCOUNT OFF
END

GO
