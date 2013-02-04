IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateDistrito]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateDistrito]
GO

CREATE PROCEDURE [dbo].[UpdateDistrito]
(
	@IDDistrito int,
	@DIS_Nombre varchar(100),
	@IDProvincia int
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [Distrito]
	SET [DIS_Nombre] = @DIS_Nombre, 
		[IDProvincia] = @IDProvincia
	WHERE [IDDistrito] = @IDDistrito

	SET NOCOUNT OFF
END

GO
