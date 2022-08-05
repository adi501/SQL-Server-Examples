USE  database;
GO
CREATE PROCEDURE dbo.sp_who
AS
    SELECT FirstName, LastName FROM Person.Person;
GO
EXEC sp_who;
EXEC dbo.sp_who;
GO
DROP PROCEDURE dbo.sp_who;
GO


Alter Procedure spGetEmployeesByGenderAndDepartment 
@Gender nvarchar(50),
@DepartmentId int
WITH ENCRYPTION
as
Begin
  Select Name, Gender from tblEmployee Where Gender = @Gender and DepartmentId = @DepartmentId
End


Create Procedure spGetEmployeeCountByGender
@Gender nvarchar(20),
@EmployeeCount int Output
as
Begin
 Select @EmployeeCount = COUNT(Id) 
 from tblEmployee 
 where Gender = @Gender
End 


Declare @EmployeeTotal int
Execute spGetEmployeeCountByGender 'Female', @EmployeeTotal output
Print @EmployeeTotal

Declare @EmployeeTotal int
Execute spGetEmployeeCountByGender 'Female', @EmployeeTotal
if(@EmployeeTotal is null)
 Print '@EmployeeTotal is null'
else
 Print '@EmployeeTotal is not null'


Declare @EmployeeTotal int
Execute spGetEmployeeCountByGender @EmployeeCount = @EmployeeTotal OUT, @Gender = 'Male'
Print @EmployeeTotal


