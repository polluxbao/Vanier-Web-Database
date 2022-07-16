Select productName from products P INNER JOIN orderDetails D
USING productCode
INNER JOIN orders O USING orderNumber
INNER JOIN customers USING customerNumber
WHERE C.city='Melbourne';


select distinct customername, customernumber
from customers C inner join order O using (customernumber);

select * from custome 
inner join (select * from asas where ...);

with melCustomer AS(
select customernumber, customername from customers there city='Melbourne'
)
select * from melCustomer;

with leslieRep as (
select employeenumber from office_employees where firstname = 'Leslie'
)
select count(*) from customers where salesrepEmployeenumber in
()


-- LATERAL
-- LISTAGG
select officeCode, LISTAGG(distinct firstname, ',') 
                    within group (order by firstname) as names
from office_employees
group by officename;

select ordernumber, orserdate, status from orders order by ordernumber
offset 30 rows fetch next 10 rows only;

select odernumber from (select rownum AS no, ordernumber from orders)
where no between 10 and 19;

set serveroutput on
declare
begin
    dbms_output.put_line("Hello World");
end;
/
GRANT EXECUTE ON SYS.DBMS_LOCK TO orcl