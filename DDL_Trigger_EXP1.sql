create database DDL

create table Tbl_Audit(ID int identity(100,1),PostTime datetime,DatabaseName Varchar(100),Event Varchar(100), ObjectName Varchar(100), TSQL Varchar(100), Login Varchar(100)) 

alter TRIGGER AuditProcChanges
ON DATABASE
FOR CREATE_TABLE,ALTER_TABLE,DROP_TABLE,CREATE_PROCEDURE, ALTER_PROCEDURE, DROP_PROCEDURE
AS

DECLARE @ed XML
SET @ed = EVENTDATA()

INSERT INTO Tbl_Audit(PostTime, DatabaseName, Event, ObjectName, TSQL, Login) 
VALUES
(
	GetDate(),
	@ed.value('(/EVENT_INSTANCE/DatabaseName)[1]', 'varchar(100)'),
	@ed.value('(/EVENT_INSTANCE/EventType)[1]', 'varchar(100)'),
	@ed.value('(/EVENT_INSTANCE/ObjectName)[1]', 'varchar(100)'),
	@ed.value('(/EVENT_INSTANCE/TSQLCommand)[1]', 'varchar(100)'),
	@ed.value('(/EVENT_INSTANCE/LoginName)[1]', 'varchar(100)')
)

Create table testDDL(Id int)

alter table testDDL Add Name varchar(100)

drop table testDDL

create procedure sp_DDL
as 
begin
select '123'
end

alter procedure sp_DDL
as 
begin
select '123'
end

drop procedure sp_DDL

select * from Tbl_Audit