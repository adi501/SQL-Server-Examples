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


CREATE PROCEDURE Sp_Emp
AS
  select * from Tbl_Employee


sp_helptext Sp_Emp

select * from Tbl_Employee


create procedure USP_Get_Employee
(
@Id int,
@F_name varchar(100),
@L_Name varchar(100),
@Sal int,
@Address varchar(200)
)
as
begin

insert into Tbl_Employee values(@Id,@F_name,@L_Name,@Sal,@Address)

end


exec USP_Get_Employee 4,'sdfds','sfsd',334534,'dfgfdgdfgd'

select * from Tbl_Employee

exec USP_Get_Employee 4,'sdfds','sfsd',334534,'dfgfdgdfgd' --error

exec USP_Get_Employee 4,'sdfds','sfsd',334534  --error

exec USP_Get_Employee 5,'sdfds','sfsd',323245,null 

create procedure USP_Get_Employee_1
(
@Id int =null,
@F_name varchar(100)  =null,
@L_Name varchar(100)  =null,
@Sal int  =null,
@Address varchar(200)  =null
)
as
begin

insert into Tbl_Employee values(@Id,@F_name,@L_Name,@Sal,@Address)

end

declare @F_name varchar(100)
declare @L_Name varchar(100)
declare @Sal int
declare @Address varchar(100)


exec USP_Get_Employee 6,@F_name,@L_Name,@Sal,@Address

exec USP_Get_Employee 7,null,null,null,null

exec USP_Get_Employee 7,null,null,null,'sdfds'

exec USP_Get_Employee 8,'sdfds'

select * from Tbl_Employee

create procedure USP_Select_Employee
as
begin
select * from Tbl_Employee
end

exec USP_Select_Employee

create procedure USP_Select_Where_Employee
@Id int 
as
begin
select * from Tbl_Employee where ID=@Id
end

exec USP_Select_Where_Employee 1

create procedure USP_update_Employee
(
@Id int,
@F_name varchar(100),
@L_Name varchar(100),
@Sal int,
@Address varchar(200)
)
as
begin

update Tbl_Employee set First_Name=@F_name,Last_Name=@L_Name,Salary=@Sal,Address=@Address where ID=@Id
end


exec USP_update_Employee 1,'aaaaaaaa','aaaaaaaaaaa',444,'aaaaaaaaa'

select * from Tbl_Employee 

create procedure USP_delete_Employee
(
@Id int
)
as
begin

delete Tbl_Employee where ID=@Id
end


exec USP_delete_Employee 1

select * from Tbl_Employee 

create procedure USP_All_Employee
(
@Id int,
@F_name varchar(100),
@L_Name varchar(100),
@Sal int,
@Address varchar(200),
@Type int
)
as
begin


if @Type=1
begin
	insert into Tbl_Employee values(@Id,@F_name,@L_Name,@Sal,@Address)
end
if @Type=2
begin
	update Tbl_Employee set First_Name=@F_name,Last_Name=@L_Name,Salary=@Sal,Address=@Address where ID=@Id
end
if @Type=3
begin
	delete Tbl_Employee where ID=@Id
end
if @Type=4
begin
	select * from Tbl_Employee
end
if @Type=5
begin
	select * from Tbl_Employee where ID=@Id
end
if @Type=6
begin
	select ID from Tbl_Employee 
end
if @Type=7
begin
	select ID,First_Name from Tbl_Employee 
end

end


exec USP_All_Employee null,null,null,null,null,4

exec USP_All_Employee 2,null,null,null,null,5