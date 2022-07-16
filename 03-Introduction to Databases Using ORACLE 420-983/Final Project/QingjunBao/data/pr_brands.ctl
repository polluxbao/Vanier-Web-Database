OPTIONS(skip=1,bindsize=1048576,rows=1024)
load data
infile './pr_brands.csv'
REPLACE into table "PR_BRANDS"
fields terminated by ','
OPTIONALLY ENCLOSED BY "'"
trailing nullcols (
    brand_id,brand_name TERMINATED BY WHITESPACE
    )

