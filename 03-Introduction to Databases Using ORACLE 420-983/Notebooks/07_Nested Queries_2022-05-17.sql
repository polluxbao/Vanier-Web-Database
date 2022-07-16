select customernumber, customername 
from customers
where customernumber 
    in (select customernumber from payments where amount>3000);

select * from payments where amount>3000;

select distinct C.customernumber, C.customername 
from payments P
    inner join customers C
    on P.customernumber = C.customernumber
where P.amount>3000;

select customernumber, customername 
from customers
where customernumber 
    not in (select customernumber from payments where amount<3000)
    and customernumber in (select customernumber from payments);

select distinct customernumber, customers.customername
from customers inner join payments
using (customernumber)
where customernumber 
    not in (select customernumber from payments where amount<3000);
    

-------------------------------------------
select "key", value from a
intersect
select "key", value from b;

select * from a
where ("key", value) in (select "key", value from b);
-------------------------------------------
create table one(A varchar(10));
insert into one(a) values('A');

create table two(A varchar(10));
insert into one(a) values('A');

create table three(A varchar(10));
insert into three(a) values('A');
insert into three(a) values('B');
insert into three(a) values('C');


select * from one;
-------------------------------------------
select customernumber, customername 
from customers
where
    3000 < any (select amount from payments 
                where customernumber=customers.customernumber);

-- 3000 < any
-- 3000 < all
-- 3000 < some


select amount from payments where customernumber = 447;                
select amount from payments where customernumber = 112;
select amount from payments where customernumber = 103;

-------------------------------------------
select customernumber, customername from customers
where
    exists (select 1 from payments
            where payments.customernumber=customers.customernumber and amount>100000);

select *
from payments, customers
where payments.customernumber=customers.customernumber and amount>100000;
            
select 1 from dual;

select * from customers where addressline2 is null;

-------------------------------------------

--Find out who borrowed all the books

select student_id, name from students
where
student_id not in
    (select distinct student_id from
        (select S.student_id, B.book_id from students S, books B
        minus
        select student_id, book_id from borrowed));


-------------------------------------------
select first_name, gender,
case gender when 'F' then 'FEMAKE'
            when 'M' then 'MALE'
end as gender
from employees;

select customernumber,
case when amount<10000 then 'POOR'
when amount between 10000 and 50000 then 'MIDDLE'
when amount >50000 then 'RICH' end as wealth
from payments;


