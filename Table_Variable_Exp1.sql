 GO
 DECLARE @TProduct TABLE
 (
 SNo INT IDENTITY(1,1),
 ProductID INT,
 Qty INT
 ) 
 --Insert data to Table variable @Product 
 INSERT INTO @TProduct(ProductID,Qty)
 SELECT DISTINCT ProductID, Qty FROM ProductsSales ORDER BY ProductID ASC 
 --Select data
 Select * from @TProduct
 
 --Next batch
 GO
 Select * from @TProduct --gives error in next batch
