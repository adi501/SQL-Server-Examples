CREATE TABLE #LocalTemp
(
 UserID int,
 Name varchar(50), 
 Address varchar(150)
)
GO
insert into #LocalTemp values ( 1, 'Adi','Anantapur');
GO
Select * from #LocalTemp
