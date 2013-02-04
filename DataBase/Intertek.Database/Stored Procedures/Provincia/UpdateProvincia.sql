IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdateProvincia]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdateProvincia]
GO

CREATE PROCEDURE [dbo].[UpdateProvincia]
(
	@IDProvincia int,
	@IDDepartamento int,
	@PRO_Nombre varchar(100)
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [Provincia]
	SET [IDDepartamento] = @IDDepartamento, 
		[PRO_Nombre] = @PRO_Nombre
	WHERE [IDProvincia] = @IDProvincia

	SET NOCOUNT OFF
END

GO
