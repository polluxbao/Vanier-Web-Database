OPTIONS(skip=1,bindsize=1048576,rows=1024)
load data
infile './pr_stores.csv'
REPLACE into table "PR_STORES"
fields terminated by ','
OPTIONALLY ENCLOSED BY "'"
trailing nullcols (
    store_id,store_name,phone,email, street,city,state,zip_code TERMINATED BY WHITESPACE
    )