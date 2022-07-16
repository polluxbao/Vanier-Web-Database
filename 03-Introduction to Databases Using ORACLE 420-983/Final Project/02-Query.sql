--2. Write a query that will return store_id, store_name, total_qty_sold, stock_qty. 
--Where total_qty_sold represents total quantity sold in that store; 
--stock_qty represents the product quantity in the store's stock.

select a.store_id, pr_stores.store_name ,a.stock_qty, b.total_qty_sold from
(select store_id, sum(quantity) as stock_qty
    from pr_stocks
    group by store_id) a
left join
(select orders.store_id store_id, sum(items.quantity) as total_qty_sold
from pr_orders orders
join pr_order_items items
on orders.order_id = items.order_id
group by orders.store_id) b
on a.store_id=b.store_id
left join pr_stores
on pr_stores.store_id = b.store_id;


--3. Create table order_items_log with the following columns: order_id, item_id, 
--product_id, quantity, changed_by, changed_date, change_type. 
--Create a trigger on the order_items table that whenever there is an 
--insert/update/delete will insert a new row into order_items_log table.
--Where the changed_by column will contain the user that changed the data 
--(given by the following statement SELECT sys_context('USERENV', 'CURRENT_USER') 
--FROM dual;); changed_date will contain the current date and change_type will 
--contain either value ‘I’ ‘U’ or ‘D’ depending on the operation performed.
create table order_items_log (
    order_id        number, 
    item_id         number, 
    product_id      number,
    quantity        number, 
    changed_by      varchar(40), 
    changed_date    date, 
    change_type     number
);

CREATE TRIGGER TrigA AFTER INSERT ON order_items
      REFERENCING NEW ROW AS new_row
BEGIN
      INSERT INTO order_items_log VALUES ('INSERT into doctable');
      INSERT INTO New_Log_Table VALUES ('INSERT into doctable',new_row.ID);
END

SELECT sys_context('USERENV', 'CURRENT_USER') FROM dual;


--4. Create function customer_bought_price(customer_id, start_date, end_date) 
--that will return an integer representing the total money amount paid by the 
--customer between start_date and end_date. Function will return 0 if there 
--are no sales for this customer.

CREATE OR REPLACE FUNCTION customer_bought_price(
    customer_id NUMBER, 
    start_date VARCHAR2(40), 
    end_date VARCHAR2(40)) 
    RETURN INT is  
    Paid number;  
BEGIN
    Paid = 0;
    select sum(items.list_price*items.discount) into Paid
    from pr_order_items items
    join pr_orders orders
    on items.order_id = orders.order_id
    where orders.order_date between start_date and end_date;
    
END customer_bought_price;

CALL customer_bought_price(customer_id, start_date, end_date);