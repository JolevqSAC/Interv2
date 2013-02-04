IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[InsertContrato]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[InsertContrato]
GO

CREATE PROCEDURE [dbo].[InsertContrato]
(
	@IDContrato int OUT,
	@CON_Codigo varchar(10),
	@CON_Descripcion varchar(200),
	@CON_FechaInico datetime,
	@CON_FechaFin datetime,
	@CON_EstadoContrato varchar(10),
	@IDCliente int,
	@CON_Estado varchar(1),
	@CON_UsuarioCreacion varchar(25),
	@CON_FechaHoraCreacion datetime,
	@CON_UsuaroModificacion varchar(25),
	@CON_FechaHoraModificacion datetime
)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO [Contrato] ([CON_Codigo], [CON_Descripcion], [CON_FechaInico], [CON_FechaFin], [CON_EstadoContrato], [IDCliente], [CON_Estado], [CON_UsuarioCreacion], [CON_FechaHoraCreacion], [CON_UsuaroModificacion], [CON_FechaHoraModificacion]) 
	VALUES (@CON_Codigo, @CON_Descripcion, @CON_FechaInico, @CON_FechaFin, @CON_EstadoContrato, @IDCliente, @CON_Estado, @CON_UsuarioCreacion, @CON_FechaHoraCreacion, @CON_UsuaroModificacion, @CON_FechaHoraModificacion)

	SET @IDContrato = SCOPE_IDENTITY()

	SET NOCOUNT OFF
END

GO
