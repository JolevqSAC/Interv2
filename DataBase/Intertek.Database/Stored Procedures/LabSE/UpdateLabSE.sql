IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateLabSE]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateLabSE]
GO

CREATE PROCEDURE [dbo].[UpdateLabSE]
(
	@IDLabSE int,
	@IDSE int,
	@IDLab int,
	@IDSolicitudEnsayo int,
	@LSE_Fecha char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [LabSE]
	SET [IDSE] = @IDSE, 
		[IDLab] = @IDLab, 
		[IDSolicitudEnsayo] = @IDSolicitudEnsayo, 
		[LSE_Fecha] = @LSE_Fecha
	WHERE [IDLabSE] = @IDLabSE

	SET NOCOUNT OFF
END

GO
