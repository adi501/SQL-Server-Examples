use b8

CREATE TABLE Tbl_Employee
(
 ID int PRIMARY KEY,
 First_Name varchar(50) NULL,
 Last_Name varchar(50) NULL,
 Salary int ,
 Address varchar(100) NULL,
)
--Insert Data into employee table
Insert into Tbl_Employee(ID,First_Name,Last_Name,Salary,Address) Values(1,'Adinarayana reddy','jc',22000,'Bangalore')
Insert into Tbl_Employee(ID,First_Name,Last_Name,Salary,Address) Values(2,'pavan','jc',15000,'Delhi')
Insert into Tbl_Employee(ID,First_Name,Last_Name,Salary,Address) Values(3,'Krishna','p',19000,'Bangalore')

--select data from employee table
Select * from Tbl_Employee 


Create function fn_Get_Employee_FullName
(
 @First_Name varchar(50),
 @Last_Name varchar(50)
)
returns varchar(101)
As
Begin 

return (Select @First_Name + ' '+ @Last_Name);

end 

select dbo.fn_Get_Employee_FullName('sdfsdf','rrrrrrrrr')

select Id,dbo.fn_Get_Employee_FullName(first_Name,Last_name) as Name,Salary,Address from Tbl_Employee

alter table Tbl_Employee add Age int


alter function Fn_age
(
 @Id int
)
returns varchar(101)
As
Begin 

declare @Age int
declare @F_name varchar(100)
declare @L_name varchar(100)
declare @Result varchar(230)

--set @Age=(select Age from Tbl_Employee where Id=@Id)
--set @F_name=(select first_Name from Tbl_Employee where Id=@Id)
--(select @L_name=Last_name from Tbl_Employee where Id=@Id)

(select top 1 @Age=Age,@F_name=first_Name, @L_name=Last_name from Tbl_Employee where Id=@Id)


if(@Age>20)
begin
     set @Result= (Select 'Mis ' + @F_name + ' '+ @L_name)
end
else
begin
     set @Result= (Select 'aaa ' + @F_name + ' '+ @L_name)
end
return @Result
end 

select Id,dbo.Fn_age(Id) as Name,Salary,Address,Age from Tbl_Employee

select Top 1 * from Tbl_Employee

select  * from Tbl_Employee


Create function fn_Get_Employee()
returns Table
As
 return (Select * from Tbl_Employee) 


alter function fn_Get_Employee1(@id int)
returns Table
As
 return (select Id,dbo.Fn_age(Id) as Name,Salary,Address,Age from Tbl_Employee where Id=@id
) 


select * from Tbl_Employee

select * from dbo.fn_Get_Employee1(1)


Create function fn_Get_Mul_Employee()
returns @Emp_tbl Table
(
Emp_ID int, 
First_Name varchar(50),
Salary int
)
As
begin
 Insert into @Emp_tbl Select e.ID,e.First_Name,e.Salary from Tbl_Employee e;
--Now update salary of first employee
 update @Emp_tbl set Salary=25000 where Emp_ID=1;
--It will update only in @Emp_tbl table not in Original Employee table
return
end 

select * from fn_Get_Mul_Employee()
