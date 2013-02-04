IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertSub_Tipo_de_Operaciones]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertSub_Tipo_de_Operaciones]
GO

CREATE PROCEDURE [dbo].[InsertSub_Tipo_de_Operaciones]
(
	@IDSubTipoOperaciones int OUT,
	@IDTiposOperaciones int,
	@STO_Nombre char(18),
	@STO_Activa char(18)
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [Sub_Tipo_de_Operaciones] ([IDTiposOperaciones], [STO_Nombre], [STO_Activa]) 
	VALUES (@IDTiposOperaciones, @STO_Nombre, @STO_Activa)

	SET @IDSubTipoOperaciones = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
