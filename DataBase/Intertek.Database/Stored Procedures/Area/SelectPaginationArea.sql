
IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SelectPaginationArea]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE [dbo].[SelectPaginationArea]
GO

CREATE PROCEDURE [dbo].[SelectPaginationArea]
(
	@PageSize int ,
	@CurrentPage int ,
	@SortColumn varchar(20),
	@SortOrder varchar(4),
	@Where varchar(max)
)
AS
BEGIN

	/****************************************************************************** 
**	Autor: MIJAIL CASTILLO ALFARO. 
**	Fecha: 17/11/2013
**	Test:exec SelectPaginationArea 4,0,'IdArea','desc',''
*******************************************************************************/
	SET NOCOUNT ON

declare @RecordCount int
declare @PageCount int
declare @PageIndex int
 
Select @RecordCount = count(IdArea)
from ViewArea

if @CurrentPage=0
	set @CurrentPage =1
	
if ISNULL(@SortColumn,'')=''
	set @SortColumn ='IdArea'	
 
set @PageCount = Ceiling(cast (@RecordCount as float) / cast (@PageSize as float))
 
if (@CurrentPage > @PageCount) set @CurrentPage = @PageCount
 
set @PageIndex = @CurrentPage - 1

declare @Query varchar(max)
 
if ISNULL(@Where, '') = ''   
begin  
 set @Query = 'Select distinct IDArea,ARE_Codigo, ARE_Nombre, ARE_Descripcion, ARE_Estado, RowNumber = ROW_NUMBER() OVER (ORDER BY ' + @SortColumn + ' ' + @SortOrder + ') from ViewArea '   
end  
else   
begin  
 set @Query = 'Select distinct IDArea,ARE_Codigo, ARE_Nombre, ARE_Descripcion, ARE_Estado, RowNumber = ROW_NUMBER() OVER (ORDER BY ' + @SortColumn + ' ' + @SortOrder + ') from ViewArea  where ' + @Where  
end  
   
set @Query = 'Select distinct  IDArea,ARE_Codigo, ARE_Nombre, ARE_Descripcion, ARE_Estado from (' + @Query + ' )as result where RowNumber BETWEEN ' + cast(@PageSize * @PageIndex + 1 as varchar(10)) + ' AND ' + cast(@PageSize * (@PageIndex + 1) as varchar(10))  
   
 print @Query  
Exec (@Query)  
  
 SET NOCOUNT OFF  
END  
  