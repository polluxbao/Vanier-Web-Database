OPTIONS(skip=1,bindsize=1048576,rows=1024)
load data
infile './pr_staffs.csv'
REPLACE into table "PR_STAFFS"
fields terminated by ','
OPTIONALLY ENCLOSED BY "'"
trailing nullcols (
    staff_id,first_name,last_name,email,phone,active,store_id,manager_id TERMINATED BY WHITESPACE
    )