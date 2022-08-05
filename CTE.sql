
---sub query without CTE is given below :
SELECT * FROM (
 SELECT Addr.Address, Emp.Name, Emp.Age From Address Addr
 Inner join Employee Emp on Emp.EID = Addr.EID) Temp
WHERE Temp.Age > 50
ORDER BY Temp.NAME


---By using CTE above query can be re-written as follows :
;With CTE1(Address, Name, Age)--Column names for CTE, which are optional
AS
(
SELECT Addr.Address, Emp.Name, Emp.Age from Address Addr
INNER JOIN EMP Emp ON Emp.EID = Addr.EID
)
SELECT * FROM CTE1 --Using CTE 
WHERE CTE1.Age > 50
ORDER BY CTE1.NAME
