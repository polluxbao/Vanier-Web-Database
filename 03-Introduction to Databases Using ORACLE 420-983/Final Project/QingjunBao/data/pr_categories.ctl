OPTIONS(skip=1,bindsize=1048576,rows=1024)
load data
infile './pr_categories.csv'
REPLACE into table "PR_CATEGORIES"
fields terminated by ','
OPTIONALLY ENCLOSED BY "'"
trailing nullcols (
    category_id,category_name TERMINATED BY WHITESPACE
    )