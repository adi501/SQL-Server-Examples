
create table Tbl_Customers(Id int identity(1,1) primary key,Name varchar(50),Age int,Address varchar(100),Salary decimal(18,2))

insert into Tbl_Customers values ('adi',35,'Ahmedabad',2000)
insert into Tbl_Customers values ('balu',25,'Delhi',1500)
insert into Tbl_Customers values ('nani',23,'Kota',2000)
insert into Tbl_Customers values ('naga',25,'Mumbai',6500)
insert into Tbl_Customers values ('vijay',27,'Bhopal',8500)
insert into Tbl_Customers values ('krishna',22,'MP',4500)
insert into Tbl_Customers values ('dasa',24,'Indore',10000)

select * from Tbl_Customers

SELECT * 
     FROM Tbl_Customers 
     WHERE ID IN (SELECT ID 
                  FROM Tbl_Customers 
                  WHERE SALARY > 4500)

create table Tbl_Customers_BKP(Id int identity(1,1) primary key,Name varchar(50),Age int,Address varchar(100),Salary decimal(18,2))

INSERT INTO Tbl_Customers_BKP
     SELECT Name,Age,Address,Salary FROM Tbl_Customers 
     WHERE ID IN (SELECT ID 
                  FROM Tbl_Customers where SALARY > 4500) 

select * from Tbl_Customers_BKP

UPDATE Tbl_Customers
     SET SALARY = SALARY * 0.25
     WHERE AGE IN (SELECT AGE FROM Tbl_Customers_BKP
                   WHERE AGE >= 27 )

select * from Tbl_Customers

DELETE FROM Tbl_Customers
     WHERE AGE IN (SELECT AGE FROM Tbl_Customers_BKP
                   WHERE AGE >= 27 )

select * from Tbl_Customers


SELECT first_name, salary, department_id
FROM employees
WHERE salary = (SELECT MIN (salary) 
		FROM employees)




