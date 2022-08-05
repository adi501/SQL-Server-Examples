create table Tbl_Departments(Id int identity(1,1) primary key,DepartmentName varchar(50))

Insert into Tbl_Departments values('HR')
Insert into Tbl_Departments values('IT') 
Insert into Tbl_Departments values('Sales') 
Insert into Tbl_Departments values('Marketing')

select * from Tbl_Departments


create table Tbl_Employee(Id int identity(1,1) primary key,
DepartID int foreign key references Tbl_Departments(Id),EmployeeName varchar(50),City varchar(50))

Insert into Tbl_Employee values(1,'Aravind','bangalore') 
Insert into Tbl_Employee values(2,'Adi','bangalore') 
Insert into Tbl_Employee values(3,'Pavan','bangalore') 
Insert into Tbl_Employee values(2,'Balu','bangalore') 
Insert into Tbl_Employee values(2,'Krishna','bangalore') 
Insert into Tbl_Employee values(3,'Arun','bangalore') 
Insert into Tbl_Employee values(3,'Nani','bangalore') 
Insert into Tbl_Employee values(1,'Madhan','bangalore') 
Insert into Tbl_Employee values(null,'Vasu','bangalore') 
Insert into Tbl_Employee values(null,'Raghu','bangalore')
Insert into Tbl_Employee values(5,'Madhan','bangalore') --error
Insert into Tbl_Employee values(55,'Madhan','bangalore') --error


select * from Tbl_Departments
select * from Tbl_Employee

select * from Tbl_Departments inner join Tbl_Employee on Tbl_Departments.Id=Tbl_Employee.DepartID

select Tbl_Employee.Id,Tbl_Employee.EmployeeName,Tbl_Employee.City,Tbl_Departments.DepartmentName from Tbl_Departments inner join Tbl_Employee on Tbl_Departments.Id=Tbl_Employee.DepartID

select E.Id,E.EmployeeName,E.City,D.DepartmentName from Tbl_Departments as D inner join Tbl_Employee As E on D.Id=E.DepartID


select E.Id,E.EmployeeName,E.City,D.DepartmentName from Tbl_Departments as D inner join Tbl_Employee As E on D.Id=E.DepartID where d.DepartmentName in ('hr','it')
 
select E.Id,E.EmployeeName,E.City,D.DepartmentName from Tbl_Departments as D inner join Tbl_Employee As E on D.Id=E.DepartID

select * from Tbl_Departments
select * from Tbl_Employee

select E.Id,E.EmployeeName,E.City,D.DepartmentName from Tbl_Departments as D left outer join Tbl_Employee As E on D.Id=E.DepartID

select E.Id,E.EmployeeName,E.City,D.DepartmentName from Tbl_Departments as D right outer join Tbl_Employee As E on D.Id=E.DepartID

select E.Id,E.EmployeeName,E.City,D.DepartmentName from Tbl_Departments as D full outer join Tbl_Employee As E on D.Id=E.DepartID

select * from Tbl_Departments
select * from Tbl_Employee

select * from Tbl_Departments , Tbl_Employee

create table Tbl_Employee1(Id int identity(1,1) primary key,EmployeeName varchar(50),ManagerId int)

Insert into Tbl_Employee1 values('Aravind',2) 
Insert into Tbl_Employee1 values('Adi',3) 
Insert into Tbl_Employee1 values('Pavan',3) 
Insert into Tbl_Employee1 values('Balu',4) 
Insert into Tbl_Employee1 values('Krishna',5) 
Insert into Tbl_Employee1 values('Arun',1)

select * from Tbl_Employee1

select e2.EmployeeName,e1.EmployeeName as 'Manager' from Tbl_Employee1 e1 INNER JOIN Tbl_Employee1 e2 on e1.Id=e2.ManagerId


