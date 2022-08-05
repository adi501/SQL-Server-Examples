create table Tbl_Sales_Data_new(Id int identity(1,1) primary key,Store_Name varchar(50),Sales int)

insert into Tbl_Sales_Data_new values ('A',300)
insert into Tbl_Sales_Data_new values ('B',null)

select * from Tbl_Sales_Data_new

SELECT SUM (ISNULL(Sales,100)) FROM Tbl_Sales_Data_new