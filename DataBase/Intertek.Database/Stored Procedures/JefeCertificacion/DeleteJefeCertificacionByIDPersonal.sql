IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteJefeCertificacionByIDPersonal]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteJefeCertificacionByIDPersonal]
GO

CREATE PROCEDURE [dbo].[DeleteJefeCertificacionByIDPersonal]
(
	@IDPersonal int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [JefeCertificacion]
	WHERE [IDPersonal] = @IDPersonal

	SET NOCOUNT OFF
END

GO
