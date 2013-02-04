IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[UpdatePais]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[UpdatePais]
GO

CREATE PROCEDURE [dbo].[UpdatePais]
(
	@IDPais int,
	@PAI_Nombre varchar(100)
)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [Pais]
	SET [PAI_Nombre] = @PAI_Nombre
	WHERE [IDPais] = @IDPais

	SET NOCOUNT OFF
END

GO
