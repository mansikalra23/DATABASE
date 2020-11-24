CREATE DATABASE company;

USE company;

create table employee -- creating table
(
ecode varchar(15) primary key, -- column_name type constraint
fname varchar(50) not null,
lname varchar(500),
doj date,
dob date,
depid varchar(10),
salary int,
foreign key (depid) references department(depid)
);
INSERT INTO employee VALUES ('123456789', 'ishani', 'pandey', '2008-01-17', '1984-01-17', '5', '20000');
INSERT INTO employee VALUES ('234567890', 'navjot', 'singh', '2006-06-24', '1990-06-24', '1', '10000');
INSERT INTO employee VALUES ('345678901', 'prachi', 'gautam', '2000-03-06', '1985-03-06', '2', '30000');
INSERT INTO employee VALUES ('456789012', 'shivani', 'chaudhary', '2007-07-27', '1990-07-27', '3', '10000');
INSERT INTO employee VALUES ('567890123', 'anmol', 'hans', '2001-08-16', '1980-08-16', '4', '25000');
INSERT INTO employee VALUES ('678901234', 'anubhuti', 'sangum', '2008-02-22', '1989-02-22', '4', '25000');


create table department
(depid varchar(10) primary key,
dname varchar(50) not null,
location varchar(50)
);
INSERT INTO department VALUES ('1', 'research', 'mumbai');
INSERT INTO department VALUES ('2', 'management', 'delhi');
INSERT INTO department VALUES ('3', 'public relation', 'mumbai');
INSERT INTO department VALUES ('4', 'marketting', 'delhi');
INSERT INTO department VALUES ('5', 'finance', 'delhi');

SELECT *
FROM employee;

select *
from employee
join department
on employee.depid = department.depid; -- using (depid) ; when column name is same
-- joiniing both tables with inner join

select fname,dname,location -- retrieving specified columns, * for all columns
from employee e, department d
where e.depid=d.depid and salary>10000 -- IMPLICIT JOIN SYNTAX
order by fname; 
-- sorting the content
-- default - ascending, DESC for descending

select distinct location -- gives unique values
from department;

select *
from employee
where (fname like 'a%' or fname like 's%' or fname like 'm%') and (dob between '1980-04-04' and '1988-09-07');
-- gives names that start with a or s, and dob between specified range
-- Wildcard Characters : % (for multiple characters), _ (for single character)
-- REGEXP can also be used for strings only. fname REGEXP '^a'
-- ^ tells beggining of string. $ tells end of string. | used as or operator. [characters]. [range of characters]

select fname,lname,dname
from employee e, department d
where (salary=10000 or salary=30000 or salary=50000) and (e.depid=d.depid);
-- salary IN (10000, 30000, 50000) 
-- different operators : >, <, >=, <=, =, !=, <> (not equal)
-- logical operators : and, or, not

select *
from employee
where dob is null; -- to get null values

select *
from employee
limit 2; 
-- returns only given limit of rows.
-- limit 2, 3; will skip first 2 record and give the nest three records.

select count(*) as no_of_employees 
from employee
where depid>3;

select max(salary), min(salary), sum(salary), avg(salary)
from employee;

select (salary*0.05)+salary as increased_salary -- changes the column name
from employee e, department d
where e.depid=d.depid and dname='finance';


-- OUTER JOIN (left join, right join)
select ecode, fname, dname
from employee e
left join department d -- it will give every records of employee table whether the condition is true or not 
	on e.depid=d.depid;
-- right join will give all the records of department table.

-- NATURAL JOIN
select ecode, fname, dname
from employee e
natural join department d;

-- CROSS JOIN ; every record in one table will combine with every record in another table
select ecode, fname, dname
from employee e
cross join department d;

-- UNION; combine results of multiple queries
select (salary*0.05)+salary as increased_salary, fname, dname
from employee e, department d
where e.depid=d.depid and dname='finance'
union
select (salary*0.1)+salary as increased_salary, fname, dname
from employee e, department d
where e.depid=d.depid and dname='management';

SELECT avg(salary), depid 
FROM employee
GROUP BY depid -- groups record by different departments
ORDER BY avg(salary);

CREATE VIEW dept4 AS --creating a virtual table
SELECT *
FROM employee
WHERE depid=4;

SELECT * 
FROM dept4;

DROP VIEW dept4; -- dropping virtual table

delete from employee
where depid=5; -- deletes the record with depid 5

-- PROCEDURES
CREATE PROCEDURE SelectAll
AS
SELECT * FROM employee
GO;

EXEC SelectAll;