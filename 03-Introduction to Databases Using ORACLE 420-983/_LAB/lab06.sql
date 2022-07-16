--File Name:    lab06.sql
--Auther:       Qingjun Bao
--Version:      1.0.0
--Date:         2022 May 16
--Description:  6_Join_Queries.pdf
--              Join syntax practice

--Using Orders schema imported in the last laboratory. Write SQL statements 
--corresponding for the following queries:


--1. Return customers name and number for those costumers that have at least 
--one order.
select DISTINCT c.customername, o.customernumber
from customers c join orders o 
on c.customernumber = o.customernumber
order by c.customername;

select c.customername, count(1) num_orders
from customers c join orders o
on c.customernumber = o.customernumber
group by c.customername
order by c.customername;

--2. Return customers name and number for those costumers that have no orders.
select customerName from customers
where customerNumber not in (select customerNumber from orders);


--3. Return customers name and number for those costumers that have at least 
--one order.
select customername, customernumber
from customers
where customernumber in 
(select customernumber from orders);



