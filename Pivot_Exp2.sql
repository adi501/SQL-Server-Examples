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


SELECT *
FROM #CourseSales
PIVOT(SUM(Earning) 
      FOR Year IN ([2012],[2013])) AS PVTTable
