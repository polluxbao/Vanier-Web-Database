select gender, count(first_name) from employees
group by gender
order by gender;

select count(*) from employees;

select gender, count(10) from employees
group by gender;

select first_name, gender, count(first_name) num from employees
group by gender, first_name
order by num desc;

select * from employees
where first_name='Inderjeet';

select * from employees
where first_name='Bader';

select state, count(*), count(addressLine2)
from customers 
group by state;

select state, count(distinct 10), count(addressLine2)
from customers 
group by state;

select state, addressLine2
from customers 
where state='NV';

select state, addressLine2
from customers 
where state='NY';

select state,count(*) as total,
count(case when creditlimit>=10000 then 1 else null end) as HC
from customers group by state;

select * from customers where state='CA';
-----------------------------------------------
select count(distinct coalesce(col, 0)) as total from test;
select count(distinct case when col is null then -1 else col end) as total from test;

