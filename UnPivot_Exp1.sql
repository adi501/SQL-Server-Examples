--Create Temporary Table #CourseSales
CREATE TABLE #CourseSales
(Course VARCHAR(50),Year INT,Earning  MONEY)
GO
--Populate Sample records
INSERT INTO #CourseSales VALUES('.NET',2012,10000)
INSERT INTO #CourseSales VALUES('Java',2012,20000)
INSERT INTO #CourseSales VALUES('.NET',2012,5000)
INSERT INTO #CourseSales VALUES('.NET',2013,48000)
INSERT INTO #CourseSales VALUES('Java',2013,30000)
GO



--PIVOT the #CourseSales table data on the Course column 
SELECT *
INTO #CourseSalesPivotResult
FROM #CourseSales
PIVOT(SUM(Earning) 
      FOR Course IN ([.NET], Java)) AS PVTTable
GO
--UNPIVOT the #CourseSalesPivotResult table data 
--on the Course column    
SELECT Course, Year, Earning
FROM #CourseSalesPivotResult
UNPIVOT(Earning
      FOR Course IN ([.NET], Java)) AS UNPVTTable
