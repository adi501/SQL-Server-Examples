
-- Create a login 
CREATE LOGIN adi WITH PASSWORD = '123'

CREATE TRIGGER LimitConnectionAfterOfficeHours
ON ALL SERVER FOR LOGON 
AS
BEGIN
 IF ORIGINAL_LOGIN() = 'adi' AND
  (DATEPART(HOUR, GETDATE()) < 9 OR
                  DATEPART (HOUR, GETDATE()) > 18)
 BEGIN
  PRINT 'You are not authorized to login after office hours'
  ROLLBACK
 END
END

--drop trigger

DROP TRIGGER LimitConnectionAfterOfficeHours ON ALL SERVER
