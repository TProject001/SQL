use sql_intro;

-- Basic operation we can do with select statement
select 10+20;
select (10+20) as sum;
select (10-20) as substract;
select (8/3) as division;

-- round the decimal place            round(value,decimal)
select round(8/3 ) as division;
select round(8/3 , 1) as division;

-- basic In-built functions
select length('India') as total_len;

select repeat('@',8);

select repeat('hi ',3);

select upper("India");
select lower("India");

select curdate();    -- display current date
select date(curdate());
select day(curdate()); -- dispaly only day of current date
select month(curdate());
select year(curdate());
select now();
select date(now());
select time(now());
select hour(time(now()));
select minute(time(now()));
select second(time(now()));

# string functions
select upper("India") as upper_case;

select lower("INDIA") as lower;
select lcase("Hello") as lower;

select length("India") as total_length;
select character_length("India") as total_length;
select char_length("India") as total_length;

-- apply above functions on table
select * from emp_details;

select Name,character_length(name) as total_len 
from emp_details; 

select concat("India"," is in Asia") as merged;
select concat("I"," Love"," India") as merged;

select reverse("Hello");

select replace("Orange is vegetable.","vegetable","fruit") as new_statement;

select length("      India       ") as newString;
select ltrim("      India       ") as newString;
select length(trim("      India        ")) as newString;
select length(ltrim("      India        ")) as newString;
select length(rtrim("      India        ")) as newString;

select position("fruit" in "orange in a fruit") as name;

select ascii('A');
select ascii('Z');
select ascii('a');
select ascii('z');