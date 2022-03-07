create table Tbl_Contact_Info(Id int identity(1,1) primary key,Name varchar(100),Business_Phone varchar(15),Cell_Phone varchar(15),Home_Phone varchar(15))

insert into Tbl_Contact_Info values('Adi','9934534','4343243','432434324')
insert into Tbl_Contact_Info values('pavan',Null,'444444','44444')
insert into Tbl_Contact_Info values('nani','5555555',Null,'777777777')
insert into Tbl_Contact_Info values('naga',null,'4343243',null)
insert into Tbl_Contact_Info values('vijay',null,null,null)

select * from Tbl_Contact_Info

SELECT Name, COALESCE (Business_Phone, Cell_Phone, Home_Phone) Contact_Phone 
FROM Tbl_Contact_Info
