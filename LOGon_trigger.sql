-- Create a login 
CREATE LOGIN adi1 WITH PASSWORD = '123'

alter TRIGGER LimitConnectionAfterOfficeHours
ON ALL SERVER FOR LOGON 
AS
BEGIN
 IF ORIGINAL_LOGIN() = 'adi1' AND
  (DATEPART(HOUR, GETDATE()) < 10 OR
                  DATEPART (HOUR, GETDATE()) > 18)
 BEGIN
  PRINT 'You are not authorized to login after office hours'
  ROLLBACK
 END
END

--drop trigger

DROP TRIGGER LimitConnectionAfterOfficeHours ON ALL SERVER

Sp_helptrigger Employee_Test
