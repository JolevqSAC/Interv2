
IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.VIEWS  WHERE TABLE_NAME = 'ViewArea')
   DROP VIEW ViewArea
GO

CREATE VIEW [dbo].[ViewArea]
	
AS 

Select distinct
	[IDArea],
	[ARE_Codigo],
	[ARE_Nombre],
	[ARE_Descripcion],
	[ARE_Estado],
	[ARE_UsuarioCreaccion],
	[ARE_FechaHoraCreacion],
	[ARE_UsuarioModificacion],
	[ARE_FechaHoraModificacion]
FROM Area

go
	