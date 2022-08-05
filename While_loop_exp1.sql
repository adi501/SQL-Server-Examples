DECLARE @LoopCounter INT = 1
WHILE ( @LoopCounter <= 4)
BEGIN
    PRINT @LoopCounter  
    SET @LoopCounter  = @LoopCounter  + 1
END


DECLARE @LoopCounter INT = 1
WHILE ( @LoopCounter <= 4)
BEGIN
   PRINT @LoopCounter  
    IF(@LoopCounter = 2)
        BREAK
    SET @LoopCounter  = @LoopCounter  + 1
END
PRINT 'Statement after while loop'


DECLARE @LoopCounter INT = 0
    WHILE ( @LoopCounter <= 3)
    BEGIN
        SET @LoopCounter  = @LoopCounter  + 1 
 
        IF(@LoopCounter = 2)
          CONTINUE
  
        PRINT @LoopCounter 
    END
    PRINT 'Statement after while loop'


DECLARE @LoopCounter INT = 1
WHILE(1=1)
BEGIN
   PRINT @LoopCounter
   SET @LoopCounter  = @LoopCounter  + 1    
   IF(@LoopCounter > 4)
    BREAK;         
END
