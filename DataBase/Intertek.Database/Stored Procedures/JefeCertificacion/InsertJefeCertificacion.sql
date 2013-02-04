IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertJefeCertificacion]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertJefeCertificacion]
GO

CREATE PROCEDURE [dbo].[InsertJefeCertificacion]
(
	@IDJefeCertificacion int OUT,
	@IDPersonal int
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [JefeCertificacion] ([IDPersonal]) 
	VALUES (@IDPersonal)

	SET @IDJefeCertificacion = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
