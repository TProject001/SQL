-- SimpliLearn Tutorial
show DATABASES;
use mysql;
show tables;

-- MySQL Built-in function
show databases;
use library;
show tables;
select * from books;
DESCRIBE books;

create database sql_intro;
show databases;
use sql_intro;

create table emp_details(
Name varchar(25),
Age int,
Gender char(1),
DOJ date,
City VARCHAR(15),
salary FLOAT
);

describe emp_details;
insert into emp_details 
values("Jimmy",35,"M","2005-05-30","Chicago",70000),
("Shana",30,"M","1996-06-25","Seattle",78000),
("Marry",28,"F","2009-03-10","Boston",62000),
("Dwayne",37,"M","2011-07-13","Austin",57000),
("Sara",32,"F","2017-10-27","New York",72000),
("Ammy",35,"F","2014-12-20","SEattle",80000);

select * from emp_details;
select name,age,city from emp_details;

-- print different (unique) city name
select distinct City from emp_details;
select distinct * from emp_details;

-- In-built Agreegate functions -- count(), sum(), avg(), min(), max()
select count(name) from emp_details;
-- give allies to resultant column name
select count(name) as count_name from emp_details;
select sum(salary) from emp_details;
select avg(salary) from emp_details;

-- where clause
select * from emp_details 
where age>30;

select name from emp_details
where gender="F";

-- and operator
select * from emp_details
where age>30 and gender="M";

-- or operator
select * from emp_details
where city="Chicago" or city="Austin";

-- in operator
select * from emp_details
where city in ("Chicago","Austin");

-- between operator (select values between range)
select * from emp_details
where DOJ between "2000-01-01" and "2010-12-31";

-- group by statement (often use with aggregate functions)
select gender,sum(salary) as total_salary from emp_details
group by gender;

-- order by keyword (sort the column in ascending or descending order)
select * from emp_details
order by salary;       -- Ascending

select * from emp_details
order by salary ASC;  -- Ascending

select * from emp_details
order by salary desc; -- Descending
