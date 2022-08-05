USE DDL 
GO 
CREATE TRIGGER PreventDropSP 
ON DATABASE 
FOR DROP_PROCEDURE 
AS
PRINT 'Dropping Procedure is not allowed. '
ROLLBACK; 
GO 

create procedure sp_DDL1
as 
begin
select 'DDL'
end

drop procedure sp_DDL1

DISABLE trigger PreventDropSP on database

drop procedure sp_DDL1
