OPTIONS(skip=1,bindsize=1048576,rows=1024)
load data
infile './pr_order_items.csv'
REPLACE into table "PR_ORDER_ITEMS"
fields terminated by ','
trailing nullcols (
    order_id,item_id,product_id,quantity,list_price,discount TERMINATED BY WHITESPACE
    )