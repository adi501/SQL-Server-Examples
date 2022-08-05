CREATE TABLE Employee (Id INT, Name NVARCHAR(100), Status TINYINT)
GO
INSERT INTO Employee( Id, Name, Status)
Values (1, 'adi', 0),
        (2, 'pavan', 0),
        (3, 'nani', 0)
GO


DECLARE @LoopCounter INT , @MaxEmployeeId INT, 
        @EmployeeName NVARCHAR(100)
SELECT @LoopCounter = min(Id),@MaxEmployeeId = max(Id) 
FROM Employee
WHILE ( @LoopCounter IS NOT NULL
        AND  @LoopCounter <= @MaxEmployeeId)
BEGIN
   SELECT @EmployeeName = Name
   FROM Employee  WHERE Id = @LoopCounter
   PRINT @EmployeeName  
   SELECT @LoopCounter  = min(Id) 
   FROM Employee  WHERE Id > @LoopCounter
END
