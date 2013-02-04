IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[GetModulosByRol]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[GetModulosByRol]
GO

CREATE PROCEDURE [dbo].[GetModulosByRol]
@IdRol int
AS
BEGIN
	SET NOCOUNT ON
select 
id,
nombre,
nombre_us,
orden
from
(
select
 Id
--menuId = case when m.menuId is null then Id else m.menuId end 
,nombre
,nombre_us,
orden
from Menu AS M 
WHERE M.estado = 1
and  m.menuId is null 
) as t
inner join  rolmenu  rmt on rmt.menuId= t.id
where  rmt.rolid=@IdRol
order by orden asc

	SET NOCOUNT OFF
END

GO
