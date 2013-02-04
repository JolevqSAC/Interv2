IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertLabSE]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertLabSE]
GO

CREATE PROCEDURE [dbo].[InsertLabSE]
(
	@IDLabSE int OUT,
	@IDSE int,
	@IDLab int,
	@IDSolicitudEnsayo int,
	@LSE_Fecha char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [LabSE] ([IDSE], [IDLab], [IDSolicitudEnsayo], [LSE_Fecha]) 
	VALUES (@IDSE, @IDLab, @IDSolicitudEnsayo, @LSE_Fecha)

	SET @IDLabSE = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
