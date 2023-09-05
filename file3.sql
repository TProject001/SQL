use sql_intro; 
show tables;
select * from emp_details;
create table employees(
Emp_Id int primary key, 
Emp_name varchar(25) ,
Age int,
Gender char(1),
DOJ date,
dept varchar(20),
City varchar(15),
salary float
);
desc employees;
insert into employees values
(101,"Jimmy",35,"M","2005-05-30","Sales","Chicago",70000),
(102,"Shana",30,"M","1996-06-25","Marketing","Seattle",78000),
(103,"Marry",28,"F","2009-03-10","Product","Boston",62000),
(104,"Dwayne",37,"M","2011-07-13","Tech","Austin",57000),
(105,"Sara",32,"F","2017-10-27","Sales","New York",72000),
(106,"Ammy",35,"F","2014-12-20","IT","Seattle",80000),
(107,"Jack",40,"M","2012-07-14","Finance","Houston",100000),
(108,"Joseph",45,"M","2016-11-23","Sales","Chicago",115000),
(109,"Marcus",25,"M","2010-07-18","HR","Boston",90000),
(110,"David",34,"M","2009-08-25","Product","Miamai",75000),
(111,"Rose",28,"F","2011-02-27","Tech","Chicago",60000),
(112,"Sophia",33,"F","2013-09-21","HR","Houston",65000),
(113,"Amelia",30,"F","2018-10-15","Finance","Austin",55000),
(114,"Robert",40,"M","2015-12-18","Sales","Detroit",95000),
(115,"William",36,"M","2016-04-20","IT","Chicago",83000),
(116,"John",32,"M","2004-08-09","Marketing","Miami",67000),
(117,"Bella",29,"F","2002-06-11","Tech","Detroit",72000),
(118,"Maya",25,"F","2018-10-15","IT","Houston",48000),
(119,"Alice",37,"F","2019-05-28","Product","Seattle",76000),
(120,"Joseph",45,"M","2016-11-23","Sales","Chicago",115000); 

select * from employees;

select distinct city from employees;
select distinct dept from employees;

-- avg age of employee
select avg(age) as avg_age from employees;

-- group by clause

-- avg age of employees in each dept
select dept,avg(age) as avg_age from employees
group by dept;
select dept,round(avg(age)) as avg_age from employees
group by dept;
select dept,round(avg(age),1) as avg_age from employees
group by dept; 

-- total salary of employee from each dept
select dept,sum(salary) as total_salary from employees
group by dept;

-- order by clause
-- No. of employee in each city
select city,count(emp_id) as total_employee from employees
group by city
order by count(emp_id) desc;

-- No. of employee that join each year

-- select year(doj) from employees; -- year() function
select year(doj) as join_year,count(emp_id) as total_emp from employees
group by year(doj)
order by count(emp_id) desc;

create table sales(
product_id int,
sell_price float,
quantity int,
state varchar(20)
);
desc sales;
insert into sales values
(121,320.0,3,"California"),
(121,320.0,6,"Texas"),
(121,320.0,4,"Alaska"),
(123,290.0,2,"Texas"),
(123,290.00,7,"California"),
(123,290.00,4,"Washington"),
(121,320.0,7,"Ohio"),
(121,320.0,2,"Arizona"),
(123,290.00,8,"Colorado");

select * from sales;
-- calculate revenue (revenue is nothing but selling_price * quantity)
select product_id, sum(sell_price * quantity) as revenue from sales
group by product_id;

create table c_product(
product_id int,
cost_price float
);
insert into c_product values
(121,270.0),
(123,250.0);
select * from c_product;

-- join sales table and product cost table
select c.product_id, sum((s.sell_price - c.cost_price) * s.quantity) as profit from sales as s 
inner join c_product as c
where s.product_id = c.product_id
group by c.product_id;

-- having clause
select * from employees;
-- find those dept whose avg salary is greater than 75000
select dept , avg(salary) as avg_salary from employees
group by dept
having avg(salary) > 75000 
order by avg(salary) desc;

-- find those cities whose total salary is greater than 200000
select city , sum(salary) as total_salary from employees
group by city
having sum(salary) > 200000
order by sum(salary) desc;

-- find dept that have more than 2 employees
select dept,count(emp_id) as total_employees from employees
group by dept
having count(emp_id)>2;
                -- or
select dept,count(*) as total_employees from employees
group by dept
having count(*)>2;

-- find those cities who have more than 2 employees other than hoston
select city , count(*) as total_employee from employees
where city <> "Houston"               --  or use != operator
group by city
having count(*)>2;

-- another way to use having clause
-- find total no. of employees in each dept that have an avg salary > 75000
select dept,sum(salary) as total_salary,count(*) as total_emp from employees
group by dept
having avg(salary)>75000;