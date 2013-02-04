IF EXISTS (SELECT * from dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectJefeCertificacionByIDPersonal]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	drop procedure [dbo].[SelectJefeCertificacionByIDPersonal]
GO

CREATE PROCEDURE [dbo].[SelectJefeCertificacionByIDPersonal]
(
	@IDPersonal int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
	[IDJefeCertificacion],
	[IDPersonal]
	FROM [JefeCertificacion]
	WHERE [IDPersonal] = @IDPersonal

	SET NOCOUNT OFF
END

GO
