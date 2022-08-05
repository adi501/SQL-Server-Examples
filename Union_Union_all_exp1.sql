create table tbl_1(Id int,Name varchar(20),Cell varchar(100)) 
create table tbl_2(Id int,Name1 varchar(20))


insert into tbl_1 values(1,'a','44') 
insert into tbl_1 values(2,'b','43534')
insert into tbl_1 values(3,'c','345435')
insert into tbl_1 values(5,'d','345435435')
insert into tbl_1 values(6,'a','34345')
insert into tbl_1 values(8,'a','75675675')
insert into tbl_1 values(9,'a','34534534')

insert into tbl_2 values(1,'a') 
insert into tbl_2 values(2,'b') 
insert into tbl_2 values(4,'c') 
insert into tbl_2 values(5,'f')
insert into tbl_2 values(7,'a') 
insert into tbl_2 values(8,'a')

select * from tbl_1
select * from tbl_2

--error
select * from tbl_1
union
select * from tbl_2

select Id,Name from tbl_1
union
select Id,Name1 from tbl_2

select Id,Name1 from tbl_2
union
select Id,Name from tbl_1

--error
select Name1,Id from tbl_2
union
select Id,Name from tbl_1

select Id,Name1 from tbl_2
union
select Id,Cell from tbl_1

select * from tbl_1
select * from tbl_2

select Id,Name from tbl_1
union
select Id,Name1 from tbl_2

select * from tbl_1
select * from tbl_2


select Id,Name from tbl_1
union all
select Id,Name1 from tbl_2


select * from tbl_1
select * from tbl_2

select Id,Name from tbl_1 
intersect 
select Id,Name1 from tbl_2


select * from tbl_1
select * from tbl_2

select Id,Name from tbl_1
 Except 
select Id,Name1 from tbl_2

