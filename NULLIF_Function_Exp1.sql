create table Tbl_Sales_Data(Id int identity(1,1) primary key,Store_Name varchar(50),Actual int,Goal int)

insert into Tbl_Sales_Data values ('A',50,50)
insert into Tbl_Sales_Data values ('B',40,50)
insert into Tbl_Sales_Data values ('C',25,30)

select * from Tbl_Sales_Data

SELECT Store_Name, NULLIF (Actual, Goal) as result FROM Tbl_Sales_Data
