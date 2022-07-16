OPTIONS(skip=1,bindsize=1048576,rows=1024)
load data
infile './pr_products.csv'
REPLACE into table "PR_PRODUCTS"
fields terminated by ','
OPTIONALLY ENCLOSED BY "'"
trailing nullcols (
    product_id,product_name,brand_id,category_id,model_year,list_price TERMINATED BY WHITESPACE
    )