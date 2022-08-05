BEGIN TRY
DECLARE @num INT, @msg varchar(200)
---- Divide by zero to generate Error
SET @num = 5/0
PRINT 'This will not execute'
END TRY
BEGIN CATCH
PRINT 'Error occured that is'
set @msg=(SELECT ERROR_MESSAGE())
print @msg;
END CATCH


 BEGIN TRY
DECLARE @num INT
---- Divide by zero to generate Error
SET @num = 5/0
PRINT 'This will not execute'
END TRY
BEGIN CATCH
SELECT ERROR_NUMBER() AS ErrorNumber, ERROR_SEVERITY() AS ErrorSeverity, ERROR_STATE() AS ErrorState, ERROR_PROCEDURE() AS ErrorProcedure, ERROR_LINE() AS ErrorLine, ERROR_MESSAGE() AS ErrorMessage;
END CATCH;


Create Procedure spSellProduct
@ProductId int,
@QuantityToSell int
as
Begin
 -- Check the stock available, for the product we want to sell
 Declare @StockAvailable int
 Select @StockAvailable = QtyAvailable 
 from tblProduct where ProductId = @ProductId
 
 -- Throw an error to the calling application, if enough stock is not available
 if(@StockAvailable < @QuantityToSell)
   Begin
  Raiserror('Not enough stock available',16,1)
   End
 -- If enough stock available
 Else
   Begin
    Begin Try
     Begin Transaction
         -- First reduce the quantity available
  Update tblProduct set QtyAvailable = (QtyAvailable - @QuantityToSell)
  where ProductId = @ProductId
  
  Declare @MaxProductSalesId int
  -- Calculate MAX ProductSalesId  
  Select @MaxProductSalesId = Case When 
          MAX(ProductSalesId) IS NULL 
          Then 0 else MAX(ProductSalesId) end 
         from tblProductSales
  --Increment @MaxProductSalesId by 1, so we don't get a primary key violation
  Set @MaxProductSalesId = @MaxProductSalesId + 1
  Insert into tblProductSales values(@MaxProductSalesId, @ProductId, @QuantityToSell)
     Commit Transaction
    End Try
    Begin Catch 
  Rollback Transaction
  Select 
   ERROR_NUMBER() as ErrorNumber,
   ERROR_MESSAGE() as ErrorMessage,
   ERROR_PROCEDURE() as ErrorProcedure,
   ERROR_STATE() as ErrorState,
   ERROR_SEVERITY() as ErrorSeverity,
   ERROR_LINE() as ErrorLine
    End Catch 
   End
End

USE abc

DECLARE @intErrorCode INT

BEGIN TRAN
    UPDATE Authors
    SET Phone = '415 354-9866'
    WHERE au_id = '724-80-9391'

    SELECT @intErrorCode = @@ERROR
    IF (@intErrorCode <> 0) GOTO PROBLEM

    UPDATE Publishers
    SET city = 'Calcutta', country = 'India'
    WHERE pub_id = '9999'

    SELECT @intErrorCode = @@ERROR
    IF (@intErrorCode <> 0) GOTO PROBLEM
COMMIT TRAN

PROBLEM:
IF (@intErrorCode <> 0) BEGIN
PRINT 'Unexpected error occurred!'
    ROLLBACK TRAN
END
