--Create Temporary Sales Table
CREATE TABLE #Sales
(SalesId INT IDENTITY(1,1), SalesDate DateTime)
GO
--Populate 1000 Sample Sales Records With 
--Random past 0-1000 days as sales date
INSERT INTO #Sales(SalesDate)
VALUES(DATEADD(dd, - CONVERT(INT, (1000+1)*RAND()),GETDATE()))
GO 1000


SELECT Year, QPivot.[1] As Q1, QPivot.[2] As Q2, 
 QPivot.[3] As Q3, QPivot.[4] As Q4
FROM (SELECT YEAR(SalesDate) [Year],
     DATEPART(QUARTER, SalesDate) [Quarter], 
         COUNT(1) [Sales Count]
      FROM #Sales
      GROUP BY YEAR(SalesDate), 
         DATEPART(QUARTER,SalesDate)) AS QuarterlyData
PIVOT( SUM([Sales Count])   
        FOR QUARTER IN ([1],[2],[3],[4])) AS QPivot
