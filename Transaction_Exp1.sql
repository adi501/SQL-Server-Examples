 CREATE TABLE Department
(
 DeptID int PRIMARY KEY, 
 DeptName varchar(50) NULL,
 Location varchar(100) NULL,
 )
GO
 CREATE TABLE Employee
(
 EmpID int PRIMARY KEY, 
 Name varchar(50) NULL,
 Salary int NULL, 
 Address varchar(100) NULL,
 DeptID int foreign Key references Department(DeptID)
) 

 --Now Insert data
INSERT INTO Department(DeptID,DeptName,Location)VALUES(1,'IT','Delhi')
GO
INSERT INTO Employee(EmpID,Name,Salary,Address,DeptID)VALUES(1,'Mohan',15000,'Delhi',1)
SELECT * FROM Department
SELECT * FROM Employee 

BEGIN TRANSACTION trans
BEGIN TRY
INSERT INTO Department(DeptID,DeptName,Location)VALUES(2,'HR','Delhi')
INSERT INTO Employee(EmpID,Name,Salary,Address,DeptID)VALUES(1,'Mohan',18000,'Delhi',1)
 IF @@TRANCOUNT > 0
 BEGIN COMMIT TRANSACTION trans
 END
END TRY
BEGIN CATCH
 print 'Error Occured'
 IF @@TRANCOUNT > 0
 BEGIN ROLLBACK TRANSACTION trans 
 END
END CATCH 

	 --Now Select data to see transaction affects
	SELECT * FROM Employee
	SELECT * FROM Department 

 -- Transaction with Save Point BEGIN TRANSACTION trans
BEGIN TRY
INSERT INTO Department(DeptID,DeptName,Location)VALUES(2,'HR','Delhi')
IF @@TRANCOUNT > 0
 BEGIN SAVE TRANSACTION trans;
 END
INSERT INTO Department(DeptID,DeptName,Location)VALUES(3,'Admin','Delhi') 
INSERT INTO Employee(EmpID,Name,Salary,Address,DeptID)VALUES(1,'Mohan',18000,'Delhi',1)
IF @@TRANCOUNT > 0
 BEGIN COMMIT TRANSACTION trans
 END
END TRY
BEGIN CATCH
 print 'Error Occured'
IF @@TRANCOUNT > 0
 BEGIN ROLLBACK TRANSACTION trans
 END
END CATCH 


--Now Select data to see transaction affects
SELECT * FROM Employee
SELECT * FROM Department 

