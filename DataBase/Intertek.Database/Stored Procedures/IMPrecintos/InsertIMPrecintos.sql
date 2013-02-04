IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertIMPrecintos]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertIMPrecintos]
GO

CREATE PROCEDURE [dbo].[InsertIMPrecintos]
(
	@IDPER int,
	@IDIM int,
	@IDInforme int,
	@IDPrecintos int,
	@IMP_Fecha char(18),
	@IMP_Tipo char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [IMPrecintos] ([IDPER], [IDIM], [IDInforme], [IDPrecintos], [IMP_Fecha], [IMP_Tipo]) 
	VALUES (@IDPER, @IDIM, @IDInforme, @IDPrecintos, @IMP_Fecha, @IMP_Tipo)

	SET NOCOUNT OFF
END

GO
