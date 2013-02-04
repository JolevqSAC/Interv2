IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateJefeCertificacion]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateJefeCertificacion]
GO

CREATE PROCEDURE [dbo].[UpdateJefeCertificacion]
(
	@IDJefeCertificacion int,
	@IDPersonal int
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [JefeCertificacion]
	SET [IDPersonal] = @IDPersonal
	WHERE [IDJefeCertificacion] = @IDJefeCertificacion

	SET NOCOUNT OFF
END

GO
