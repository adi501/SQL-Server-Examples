create function RecursiveTest(@V int)
returns @t table (i int)
as
   begin
   set @v = @v - 1
   if @v<>0
     insert into @t 
     select @v union 
     select * from dbo.RecursiveTest(@v)
   else
     insert into @t values (0)
   return
   end

select * from dbo.RecursiveTest(10)