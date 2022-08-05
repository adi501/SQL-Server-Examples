CREATE TABLE Tbl_Employee(
	ID int primary key,
	First_Name varchar(50) NULL,
	Last_Name varchar(50) NULL,
	Salary int NULL,
	Address varchar(100) NULL,
)

INSERT Tbl_Employee (ID, First_Name, Last_Name, Salary, Address) VALUES (1, 'Adinarayana reddy', 'jc', 22000, 'Bangalore')
INSERT Tbl_Employee (ID, First_Name, Last_Name, Salary, Address) VALUES (2, 'pavan', 'jc', 15000, 'Delhi')
INSERT Tbl_Employee (ID, First_Name, Last_Name, Salary, Address) VALUES (3, 'Krishna', 'p', 19000, 'Bangalore')


select * from Tbl_Employee

select First_Name,Last_Name,Address from Tbl_Employee

CREATE VIEW View__Employee
As
SELECT  First_Name,Last_Name,Address  FROM Tbl_Employee

--Execute View
select * from View__Employee

select First_Name,Last_Name from View__Employee


alter VIEW View__Employee
As
SELECT  Id,First_Name,Last_Name  FROM Tbl_Employee

insert into View__Employee values(4,'aaaaaaa','ffffffffffffff')

update View__Employee set First_Name='bbbbbbbbb' where ID=4

delete View__Employee where ID=4

select * from View__Employee

create table Tbl_Departments(Id int identity(1,1) primary key ,Name varchar(100))
create table Tbl_Employee1(Id int identity(1,1) primary key ,Dep_Id int foreign key references Tbl_Departments(Id),Name varchar(100))

create VIEW View_Dep_Employee
As
SELECT  E.Id,E.Name,D.Name as D_Name from Tbl_Departments as D inner join Tbl_Employee1 as E on d.Id=e.Dep_Id


select * from View_Dep_Employee

insert into View_Dep_Employee values(4,'aaaaaaa','ffffffffffffff') ---error

drop view View__Employee

create VIEW View_Employee1
As
SELECT  Id,First_Name,Last_Name  FROM Tbl_Employee order by ID

create VIEW View_Employee1
As
SELECT  top 10 Id,First_Name,Last_Name  FROM Tbl_Employee 

select * from  View_Employee1 order by ID
