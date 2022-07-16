OPTIONS(skip=1,bindsize=1048576,rows=1024)
load data
infile './pr_stocks.csv'
REPLACE into table "PR_STOCKS"
fields terminated by ','
trailing nullcols (
    store_id,product_id,quantity TERMINATED BY WHITESPACE
    )