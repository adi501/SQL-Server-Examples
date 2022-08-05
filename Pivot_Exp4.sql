--Create Temporary Sales Table
CREATE TABLE #Sales
(SalesId INT IDENTITY(1,1), SalesDate DateTime)
GO
--Populate 1000 Sample Sales Records With 
--Random past 0-1000 days as sales date
INSERT INTO #Sales(SalesDate)
VALUES(DATEADD(dd, - CONVERT(INT, (1000+1)*RAND()),GETDATE()))
GO 1000




SELECT *
FROM (SELECT YEAR(SalesDate) [Year], 
       DATENAME(MONTH, SalesDate) [Month], 
       COUNT(1) [Sales Count]
      FROM #Sales
      GROUP BY YEAR(SalesDate), 
      DATENAME(MONTH, SalesDate)) AS MontlySalesData
PIVOT( SUM([Sales Count])   
    FOR Month IN ([January],[February],[March],[April],[May],
    [June],[July],[August],[September],[October],[November],
    [December])) AS MNamePivot
