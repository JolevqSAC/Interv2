IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[DeleteJefeCertificacion]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[DeleteJefeCertificacion]
GO

CREATE PROCEDURE [dbo].[DeleteJefeCertificacion]
(
	@IDJefeCertificacion int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM [JefeCertificacion]
	WHERE [IDJefeCertificacion] = @IDJefeCertificacion

	SET NOCOUNT OFF
END

GO
