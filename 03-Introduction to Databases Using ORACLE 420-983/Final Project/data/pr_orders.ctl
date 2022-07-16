OPTIONS(skip=1,bindsize=1048576,rows=1024)
load data
infile './pr_orders.csv'
REPLACE into table "PR_ORDERS"
fields terminated by ','
OPTIONALLY ENCLOSED BY "'"
trailing nullcols (
    order_id,customer_id,order_status,
    order_date,
    required_date,
    shipped_date,
    store_id,staff_id TERMINATED BY WHITESPACE
    )