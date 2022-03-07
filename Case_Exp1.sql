
create table Tbl_Store(Id int identity(1,1) primary key,Store_Name varchar(100),Sales decimal(18,2),Txn_Date date)

insert into Tbl_Store values('A',1500,GETDATE())
insert into Tbl_Store values('B',250,DATEADD(DD,10,GETDATE()))
insert into Tbl_Store values('C',300,DATEADD(DD,15,GETDATE()))
insert into Tbl_Store values('D',700,DATEADD(DD,20,GETDATE()))

select * from Tbl_Store

SELECT Store_Name, CASE Store_Name
  WHEN 'A' THEN Sales * 2
  WHEN 'B' THEN Sales * 1.5
  ELSE Sales
  END "New Sales",Txn_Date
FROM Tbl_Store


SELECT Store_Name, Txn_Date, CASE
  WHEN Sales >= 1000 THEN 'Good Day'
  WHEN Sales >= 500 THEN 'OK Day'
  ELSE 'Bad Day'
  END "Sales Status"
FROM Tbl_Store

SELECT Store_Name, CASE Store_Name
  WHEN 'A' THEN Sales * 2
  WHEN 'B' THEN Sales * 1.5
  ELSE Sales
  END
"New Sales",
Txn_Date
FROM Tbl_Store

SELECT Store_Name, CASE
  WHEN Store_Name = 'A' THEN Sales * 2
  WHEN Store_Name = 'B' THEN Sales * 1.5
  ELSE Sales
  END
"New Sales",
Txn_Date
FROM Tbl_Store
