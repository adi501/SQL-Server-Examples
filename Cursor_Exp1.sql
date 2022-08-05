 CREATE TABLE Employee
(
 EmpID int PRIMARY KEY,
 EmpName varchar (50) NOT NULL,
 Salary int NOT NULL,
 Address varchar (200) NOT NULL,
)
GO
INSERT INTO Employee(EmpID,EmpName,Salary,Address) VALUES(1,'Mohan',12000,'Noida')
INSERT INTO Employee(EmpID,EmpName,Salary,Address) VALUES(2,'Pavan',25000,'Delhi')
INSERT INTO Employee(EmpID,EmpName,Salary,Address) VALUES(3,'Amit',22000,'Dehradun')
INSERT INTO Employee(EmpID,EmpName,Salary,Address) VALUES(4,'Sonu',22000,'Noida')
INSERT INTO Employee(EmpID,EmpName,Salary,Address) VALUES(5,'Deepak',28000,'Gurgaon')
GO
SELECT * FROM Employee 


SET NOCOUNT ON
DECLARE @Id int
DECLARE @name varchar(50)
DECLARE @salary int
 DECLARE cur_emp CURSOR
STATIC FOR 
SELECT EmpID,EmpName,Salary from Employee
OPEN cur_emp
IF @@CURSOR_ROWS > 0
 BEGIN 
 FETCH NEXT FROM cur_emp INTO @Id,@name,@salary
 WHILE @@Fetch_status = 0
 BEGIN
 PRINT 'ID : '+ convert(varchar(20),@Id)+', Name : '+@name+ ', Salary : '+convert(varchar(20),@salary)
 FETCH NEXT FROM cur_emp INTO @Id,@name,@salary
 END
END
CLOSE cur_emp
DEALLOCATE cur_emp
SET NOCOUNT OFF 
