describe emp_details;
alter table emp_details modify column joining varchar(20);
describe emp_details;

alter table emp_details
    modify column project varchar(20),
    modify column sal int;

describe emp_details;
alter table emp_details
    modify column joining datetime;
select * from emp_details;

alter table emp_details
    modify column project date;
select * from emp_details;

alter table emp_details
    modify column project datetime;
select * from emp_details;

select min(sal) from emp_details;
select min(empname) from emp_details;
select max(empname) from emp_details;
select avg(empname) from emp_details;
select sum(sal) from emp_details;
select sum(empname) from emp_details;
select min(joining) from emp_details;
select max(joining) from emp_details;
select avg(joining) from emp_details;

SELECT FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(joining))) AS avg_joining
FROM emp_details;

select count(*) from emp_details;

select count(distinct (sal)) from emp_details;
select distinct(location) from emp_details;
insert into emp_details(location) values ('Pune');
select distinct(location) from emp_details;
select * from emp_details limit 3;

select * from emp_details order by sal desc limit 3;
update emp_details set empname = null where empname = 'Alice Johnson';
select * from emp_details order by empname;
update emp_details set sal = 757890 where empid>10;
update emp_details set sal = null where empid>15;

update emp_details set sal = null where sal = 75001;
select * from emp_details order by sal desc;

CREATE TABLE group_details (
                             name VARCHAR(50),
                             department VARCHAR(50),
                             joining_date DATE,
                             salary DECIMAL(10, 2)
);

INSERT INTO group_details(name, department, joining_date, salary) VALUES
                                                                     ('Alice', 'HR', '2023-01-01', 50000),
                                                                     ('Bob', 'IT', '2023-02-15', 60000),
                                                                     ('Charlie', 'IT', '2023-03-01', 70000),
                                                                     ('Diana', 'Finance', '2023-01-10', 55000),
                                                                     ('Eve', 'HR', '2023-02-20', 50000),
                                                                     ('Frank', 'IT', '2023-01-25', 80000),
                                                                     ('Grace', 'Finance', '2023-03-15', 75000),
                                                                     ('Hannah', 'HR', '2023-01-30', 48000),
                                                                     ('Ivan', 'Finance', '2023-02-05', 65000),
                                                                     ('Jack', 'IT', '2023-01-18', 72000),
                                                                     ('Kelly', 'HR', '2023-03-10', 52000),
                                                                     ('Leo', 'Finance', '2023-02-25', 69000),
                                                                     ('Mona', 'IT', '2023-03-08', 71000),
                                                                     ('Nina', 'HR', '2023-02-02', 53000),
                                                                     ('Oscar', 'Finance', '2023-01-12', 60000),
                                                                     ('Paul', 'IT', '2023-02-18', 75000),
                                                                     ('Quinn', 'Finance', '2023-01-28', 72000),
                                                                     ('Rita', 'HR', '2023-03-22', 51000),
                                                                     ('Sam', 'IT', '2023-03-12', 68000);
select * from group_details;

insert into group_details values ('Tom', 'Marketing', '2023-01-15', 62000),
                                 ('Uma', 'Marketing', '2023-02-10', 64000),
                                 ('Vera', 'Sales', '2023-01-23', 59000),
                                 ('Wendy', 'Sales', '2023-02-14', 60000),
                                 ('Xander', 'Legal', '2023-03-05', 71000),
                                 ('Yara', 'Legal', '2023-03-17', 73000),
                                 ('Zane', 'Operations', '2023-01-05', 65000),
                                 ('Ava', 'Operations', '2023-02-07', 67000),
                                 ('Ben', 'R&D', '2023-01-28', 73000),
                                 ('Clara', 'R&D', '2023-03-10', 76000),
                                 ('David', 'R&D', '2023-02-18', 74000),
                                 ('Ella', 'R&D', '2023-03-20', 71000),
                                 ('Finn', 'Customer Support', '2023-01-12', 50000),
                                 ('Grace', 'Customer Support', '2023-02-22', 52000),
                                 ('Helen', 'Customer Support', '2023-03-01', 54000),
                                 ('Ivy', 'Customer Support', '2023-03-15', 56000);


select department , max(salary) as salary from group_details group by department;
select department , avg(salary) as salary from group_details group by department;

select department as dept from group_details where name like '%b%' group by department ;
#with cte as (select department as dept from group_details where name like '%b%' group by department) select name from group_details where department = cte.dept ;
#select name from group_details where department as (select department from group_details where name like '%b%' group by department) ;


select name from group_details where name like '%b%' and (department = 'IT' or department = 'R&D');

select department , count(*) as dis_sal from group_details group by department;
select department,min(salary) as min from group_details group by department having min(salary)>70000;
select department from group_details group by department having substring(min(name),1,1)='a';

create table test_pk(id int primary key,age int,name varchar(20));
insert into test_pk (id,age) values(1,20);
select * from test_pk;

create table test_unique(id int unique,age int);
insert into test_unique values(1,20);
#update test_unique set id = 2 where id is null;
select * from test_unique;

create table test_null(id int,name varchar(20) not null);
insert into test_null values(101,'Sahil'),(102,'null');
select * from test_null;

create table test_unique_notnull(id int primary key,age int,roll_no int unique not null);
insert into test_unique_notnull
            (id,roll_no)
            values(1,12),
                  (2,13);
select * from test_unique_notnull;

create table test_default(id int,city varchar(20) default 'Pune');
insert into test_default
        (id,city)
        values(12,'Mumbai');

insert into test_default
        (id)
        values(13);

insert into test_default
(id)
values(13),
      (13),
      (13),
      (13),
      (13),
      (13),
      (13);
select * from test_default;

create table test_check(id int,age int check(age>=18));
insert into test_check(age)
            values(18);
select * from test_check;

create table test_check_default(id int,birthdate date default '1977-06-01' check(birthdate >= '1977-06-01'));
insert into test_check_default(birthdate)
            values('1978-09-09');
insert into test_check_default(id)
values(12);
insert into test_check_default(id)
values(12);
insert into test_check_default(id)
values(12);
insert into test_check_default(id)
values(12);
insert into test_check_default(id)
values(12);
insert into test_check_default(id)
values(12);
insert into test_check_default(id)
values(12);
insert into test_check_default(id)
values(12);
select * from test_check_default;

create table test_inc(roll int auto_increment primary key ,age int)
        auto_increment = 45;

insert into test_inc(age)
values(12);
insert into test_inc(age)
values(12);
insert into test_inc(age)
values(12);
insert into test_inc(age)
values(12);
insert into test_inc(age)
values(12);
insert into test_inc(age)
values(12);
insert into test_inc(age)
values(12);
insert into test_inc(age)
values(12);
select * from test_inc;
set sql_safe_updates = 0;
delete from test_inc;


insert into test_inc(age) values(12);
select * from test_inc;

truncate table test_inc;
insert into test_inc(age) values(12);
select * from test_inc;

create table test_inc2(roll int auto_increment primary key ,age int)
    auto_increment = 45;
insert into test_inc2(age) values(12);
select * from test_inc2;

create table test_inc3(roll int auto_increment primary key ,age int);
alter table test_inc3 auto_increment = 45;
insert into test_inc3(age) values(12);
select * from test_inc3;


create table test_inc4(roll int auto_increment primary key ,age int);
set @@auto_increment_increment = 1;

alter table test_inc4 auto_increment = 45;
insert into test_inc4(age) values(12);
select * from test_inc4;



create table test_inc5(roll int auto_increment primary key ,age int);
set @@auto_increment_increment = 1;

alter table test_inc5 auto_increment = 45;
insert into test_inc5(age) values(12);
select * from test_inc5;

create table test_inc6(roll int auto_increment primary key ,age int);
set @@auto_increment_increment = 10;

alter table test_inc6 auto_increment = 45;
insert into test_inc6(age) values(12);
select * from test_inc6;

create table test_inc7(roll int auto_increment primary key ,age int);
alter table test_inc7 auto_increment = 45;

set @@auto_increment_increment = 10;

insert into test_inc7(age) values(12);
select * from test_inc7;


-- Create the table
CREATE TABLE test_inc9 (
                           roll INT PRIMARY KEY AUTO_INCREMENT,
                           age INT
);

-- Set the starting point for auto-increment
ALTER TABLE test_inc9 AUTO_INCREMENT = 45;

-- Create a trigger to increment by 10
DELIMITER //

CREATE TRIGGER before_insert_test_inc9
    BEFORE INSERT ON test_inc9
    FOR EACH ROW
BEGIN
    DECLARE max_roll INT;
    SELECT COALESCE(MAX(roll), 45) INTO max_roll FROM test_inc9;
    SET NEW.roll = max_roll + 10;
END; //

DELIMITER ;

-- Insert the values
INSERT INTO test_inc9 (age) VALUES
                                (25),
                                (30),
                                (35),
                                (40);

-- Select all records to verify the insertion
SELECT * FROM test_inc9;

drop table test_inc8;

-- Create the table
CREATE TABLE test_inc8 (
                           roll INT PRIMARY KEY AUTO_INCREMENT,
                           age INT
);

-- Set the starting point for auto-increment
ALTER TABLE test_inc8 AUTO_INCREMENT = 45;

-- Insert values (roll will auto-increment by 1)
INSERT INTO test_inc8 (age) VALUES
                                (25),
                                (30),
                                (35),
                                (40);

-- Select all records to verify the insertion
SELECT * FROM test_inc8;
set @@auto_increment_increment = 1;
create table test_my_inc(roll int auto_increment PRIMARY KEY,age int);
alter table test_my_inc auto_increment = 45;
insert into test_my_inc(age) values(23);
set @@auto_increment_increment = 10;
insert into test_my_inc(age) values(23),
                                   (23),
                                   (23),
                                   (23),
                                   (23),
                                   (23),
                                   (23),
                                   (23),
                                   (23);
select * from test_my_inc;

create table test_my_inc2(roll int PRIMARY KEY auto_increment ,age int);
alter table test_my_inc2 auto_increment = 45;
set @@auto_increment_increment = 10;

insert into test_my_inc2(age) values(23);
insert into test_my_inc2(age) values(23),
                                   (23),
                                   (23),
                                   (23),
                                   (23),
                                   (23),
                                   (23),
                                   (23),
                                   (23);
select * from test_my_inc2;
drop table test_my_inc2;


create table test_my_inc3(roll int default 45 check((roll - 45)%10=0),age int);
alter table test_my_inc3 auto_increment = 45;
set @@auto_increment_increment = 10;

insert into test_my_inc3(age) values(23);
insert into test_my_inc3(age) values(23),
                                    (23),
                                    (23),
                                    (23),
                                    (23),
                                    (23),
                                    (23),
                                    (23),
                                    (23);
select * from test_my_inc3;
drop table test_my_inc3;

set @@auto_increment_increment = 45;
create table test_my_inc4(roll int PRIMARY KEY auto_increment ,age int);
-- alter table test_my_inc4 auto_increment = 45;

insert into test_my_inc4(age) values(23);
set @@auto_increment_increment = 10;

insert into test_my_inc4(age) values(23),
                                    (23),
                                    (23),
                                    (23),
                                    (23),
                                    (23),
                                    (23),
                                    (23),
                                    (23);
select * from test_my_inc4;



-- Create the table with the new name
CREATE TABLE test_inc10 (
                            roll INT AUTO_INCREMENT PRIMARY KEY,
                            age INT
) AUTO_INCREMENT = 45;  -- Start from 45

-- Set the increment step to 10
SET @@auto_increment_increment = 10;

-- Insert rows
INSERT INTO test_inc10(age) VALUES(23);
INSERT INTO test_inc10(age) VALUES(23);
INSERT INTO test_inc10(age) VALUES(23);
INSERT INTO test_inc10(age) VALUES(23);
INSERT INTO test_inc10(age) VALUES(23);
INSERT INTO test_inc10(age) VALUES(23);
INSERT INTO test_inc10(age) VALUES(23);
INSERT INTO test_inc10(age) VALUES(23);

-- Select to verify the result
SELECT * FROM test_inc10;


CREATE TABLE large_table_10_columns (
                                        id INT PRIMARY KEY,               -- Manually assigned unique ID
                                        name VARCHAR(100),                 -- Name of the user
                                        email VARCHAR(100),                -- Email address
                                        age INT,                           -- Age of the user
                                        created_at DATETIME,               -- Date and time when the record was created
                                        amount DECIMAL(10, 2),             -- Monetary amount
                                        status ENUM('active', 'inactive', 'pending'),  -- User status
                                        last_login DATE,                   -- Last login date
                                        address VARCHAR(255),              -- User's address
                                        phone_number VARCHAR(20)           -- User's phone number
);

INSERT INTO large_table_10_columns (id, name, email, age, created_at, amount, status, last_login, address, phone_number)
VALUES
    (1, 'John Doe', 'john.doe@example.com', 30, NOW(), 2500.50, 'active', CURDATE(), '123 Main St, City', '555-1234'),
    (2, 'Jane Smith', 'jane.smith@example.com', 25, NOW(), 3000.00, 'inactive', CURDATE(), '456 Oak Ave, Town', '555-5678'),
    (3, 'Emily White', 'emily.white@example.com', 35, NOW(), 4500.75, 'active', CURDATE(), '789 Pine Rd, Village', '555-8765'),
    (4, 'Michael Johnson', 'michael.johnson@example.com', 40, NOW(), 1200.25, 'pending', CURDATE(), '321 Maple Blvd, City', '555-1122'),
    (5, 'Sarah Lee', 'sarah.lee@example.com', 29, NOW(), 5600.40, 'active', CURDATE(), '654 Cedar Dr, Town', '555-3344'),
    (6, 'David Brown', 'david.brown@example.com', 50, NOW(), 1500.00, 'inactive', CURDATE(), '987 Birch Ln, Village', '555-5566'),
    (7, 'Laura Green', 'laura.green@example.com', 28, NOW(), 2300.20, 'active', CURDATE(), '135 Elm St, City', '555-7788'),
    (8, 'James Black', 'james.black@example.com', 45, NOW(), 3900.90, 'pending', CURDATE(), '246 Redwood Ave, Town', '555-9900'),
    (9, 'Olivia Scott', 'olivia.scott@example.com', 32, NOW(), 3100.60, 'active', CURDATE(), '369 Willow Rd, Village', '555-2233'),
    (10, 'William Harris', 'william.harris@example.com', 37, NOW(), 4200.80, 'inactive', CURDATE(), '147 Maple St, City', '555-4455');

SELECT * FROM large_table_10_columns;

create table test_fk(id int , constraint foreign key (id) references large_table_10_columns(id),age int);
insert into test_fk(id,age) values(null,12);
select * from test_fk;

update test_fk set id = 10 where id is null;
select * from test_fk;


create database workbench2;
use workbench2;
create table set1(id int, name varchar(10));
create table set2(id int, name varchar(10));
insert into set1 values (1,'A');
insert into set1 values (2,'B');
insert into set1 values (3,'C');
insert into set1 values (4,'D');
select * from set1;

insert into set2 values (4,'D');
insert into set2 values (4,'E');
insert into set2 values (6,'F');
insert into set2 values (7,'G');
select * from set1;
select * from set2;

select * from set1 union select * from set2;
select * from set1 union  all select * from set2;
select * from set1 intersect select * from set2;
select * from set1 except select * from set2;
select * from set2 except select * from set1;

-- select * from set1 minus select * from set2;
select id from set1 except select id from set2;
select id from set2 except select id from set1;

select * from INFORMATION_SCHEMA.COLUMNS








    ---create table set1(id int, name varchar(10));
----create table set2(id int, name varchar(10));
--insert into set1 values (1,'A');
--insert into set1 values (2,'B');
----insert into set1 values (3,'C');
--insert into set1 values (4,'D');
--insert into set2 values (4,'D');
--insert into set2 values (4,'E');
--insert into set2 values (6,'F');
--insert into set2 values (7,'G');







Create Table A (Aid int, Name varchar(20));
Create Table B (Bid int, Name varchar(20),Aid int);

insert Into A values(1,'Sam');
insert Into A values(2,'tom');
insert Into A values(3,'harry');
insert Into A values(4,'katich');
insert Into A values(5,'kate');



insert Into B values(11,'harry',3);
insert Into B values(12,'katich',4);
insert Into B values(13,'kate',5);
insert Into B values(14,'mate',6);
insert Into B values(15,'sat',7);

select * from A;
select * from B;

-- select * from A join B on table_name1.common col=table name2.common col;
select * from A join B on A.Aid=B.Aid;

select A.Aid,A.name from A join B on A.Aid=B.Aid;
select A.Aid,A.Name,Bid from A join B on A.Aid = B.Aid;

-- LEFT
select * from A LEFT join B on A.Aid%B.Aid=0; -- FOR whole table A and B

select A.Aid,A.Name from A LEFT join B on A.Aid=B.Aid;
select * from A right join B on A.Aid=B.Aid;
select * from A full join B on A.Aid=B.Aid;
SELECT * FROM A
                  LEFT JOIN B ON A.Aid = B.Aid
UNION
SELECT * FROM A
                  RIGHT JOIN B ON A.Aid = B.Aid;


---i have 3 tables A,B,C,D
--select * from A join B on A.Aid=B.Aid JOIN c on b.Bid=c.bid join D on c.cid=d.cid;

--inner outer
--Equi join

create table EMP_new (id int, name varchar (10),Company varchar (10),Work varchar (10));
insert into EMP_new values (1,'Amit','Info','pune')
insert into EMP_new values (2,'Puja','Tcs','Mumbai')
insert into EMP_new values (3,'Poonam','Tech','Pune')
insert into EMP_new values (4,'Abhi','Logic','Nagpur')
insert into EMP_new values (5,'Kirti','Lim','Nagar');

create table Job (salary int,base varchar (10),id int)
insert into job values (10000,'Pune',1)
insert into job values (20000,'Mumbai',3)
insert into job values (30000,'Nagpur',4)
insert into job values (40000,'Pune',5)
insert into job values (35000,'Nagar',2);
select * from EMP_new;
select * from job;

select * from EMP_new  join Job on EMP_new.id=job.id where EMP_new.Work=job.base;
select * from EMP_new,Job where EMP_new.id=Job.id and EMP_new.Work=job.base;

--cross joine-1u
select * from A
select * from B

select * from A cross join B;

--self join (only one table)

create table ABC (salary int,base varchar (10),id int)
insert into ABC values (10000,'Pune',1)
insert into ABC values (20000,'Mumbai',3)
insert into ABC values (30000,'Nagpur',4)
insert into ABC values (40000,'Pune',5)
insert into ABC values (35000,'Nagar',2);
SELECT * FROM ABC

SELECT * FROM ABC AS A1,ABC AS A2






CREATE TABLE Products (
                          ProductID INT PRIMARY KEY,
                          ProductName VARCHAR(100)
);

CREATE TABLE Regions (
                         RegionID INT PRIMARY KEY,
                         RegionName VARCHAR(100)
);

-- Insert into Products table
INSERT INTO Products (ProductID, ProductName)
VALUES
    (1, 'Laptop'),
    (2, 'Smartphone');

-- Insert into Regions table
INSERT INTO Regions (RegionID, RegionName)
VALUES
    (1, 'North America'),
    (2, 'Europe');

select * from Products cross join Regions;

select * from Products as p1, Products as p2 where p1.ProductID != p2.ProductID;

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

create table inv_selfjoin(empid int,empname varchar(1),manager_id int);
insert into inv_selfjoin
    values(1,'A',2),
          (2,'B',4),
          (3,'C',4),
          (4,'D',null);

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- INV QUE
-- 1st operation --> inv -> sj1
--                   inv -> sj2
-- 2nd op --> sj1.empid = sj2.manager_id
-- 3rd op --> select sj2.empname
--            sj1.empname as manager_name

select sj2.empname,
       sj1.empname as manager_name
        from inv_selfjoin as sj1,
             inv_selfjoin as sj2
        where sj1.empid=sj2.manager_id;
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT ProductName, RegionName
FROM Products
         INNER JOIN Regions ON Products.ProductID = Regions.RegionID
WHERE ProductName LIKE 'S%'
ORDER BY RegionName
LIMIT 10;

-- 1st op - FROM --> Products
-- 2nd op - JOIN --> INNER JOIN Regions ON Products.ProductID = Regions.RegionID
-- 3rd op - WHERE --> ProductName LIKE 'S%'
-- 4th op - ORDER BY --> RegionName
-- 5th op - LIMIT - 10
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
drop table game;
create table game(S int,game_id varchar(2));
insert into game values(1,'A1'),
                        (2,'B1'),
                        (3,'C2'),
                        (1,'B1'),
                        (4,'T1'),
                        (2,'T1');
select * from game;

select distinct(g1.S) from game as g1,
                           game as g2
                      where g1.S = g2.S and g1.game_id != g2.game_id;
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

create table test_over(id int , age int , sal int);
insert into test_over values(1 , 20 , 754567),
                            (2 , 21 , 678987),
                            (2 , 21 , 678987),
                            (2 , 21 , 678987),
                            (2 , 21 , 678987),
                            (3,18,34445),
                            (4 , 45 , 909890),
                            (4 , 45 , 909890),
                            (4 , 45 , 909890),
                            (4 , 45 , 909890),
                            (4 , 45 , 909890);
select * from test_over;

select *,rank() over (order by sal desc) as rankk from test_over;
select *,dense_rank() over (order by sal desc) as des_rank from test_over;
select *,row_number() over (order by sal desc) as rownum from test_over;

with cte as
    (select *,dense_rank() over(order by sal) as
        densed_rank from test_over)
    select * from cte where densed_rank < 3;

with cte as
         (select *,dense_rank() over(partition by age order by sal desc) as
             densed_rank from test_over)
select distinct(sal) as 2nd_sal,age as age_group from cte where densed_rank = 2;

insert into test_over values(1 , 45 , 754567),
                            (2 , 23 , 678987),
                            (2 , 21 , 678987),
                            (2 , 26 , 678987),
                            (2 , 29 , 678987),
                            (3,19,34445),
                            (4 , 23 , 909890),
                            (4 , 45 , 909890),
                            (4 , 21 , 909890),
                            (4 , 29 , 909890),
                            (4 , 45 , 909890);

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

use DDL;
select * from over_Test;

with cte as (select *,row_number() over (partition by Gender order by Gender desc) as alt from over_Test) select * from cte order by alt;

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- FINDING DUPLICATE ROWS

insert into group_details values ('Tom', 'Marketing', '2023-01-15', 62000),
                                 ('Uma', 'Marketing', '2023-02-10', 64000),
                                 ('Vera', 'Sales', '2023-01-23', 59000),
                                 ('Wendy', 'Sales', '2023-02-14', 60000),
                                 ('Xander', 'Legal', '2023-03-05', 71000),
                                 ('Yara', 'Legal', '2023-03-17', 73000),
                                 ('Zane', 'Operations', '2023-01-05', 65000);
with cte as (select *,row_number() over (partition by name,department,joining_date,salary order by salary) as dup from group_details) select * from cte where dup = 2;
