IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectJefeCertificacion]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectJefeCertificacion]
GO

CREATE PROCEDURE [dbo].[SelectJefeCertificacion]
(
	@IDJefeCertificacion int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDJefeCertificacion],
	[IDPersonal]
	FROM [JefeCertificacion]
	WHERE [IDJefeCertificacion] = @IDJefeCertificacion

	SET NOCOUNT OFF
END

GO
