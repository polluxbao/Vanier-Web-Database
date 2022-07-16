OPTIONS(skip=1,bindsize=1048576,rows=1024)
load data
infile './pr_customers.csv'
REPLACE into table "PR_CUSTOMERS"
fields terminated by ','
OPTIONALLY ENCLOSED BY "'"
trailing nullcols (customer_id,first_name,last_name,phone,email,street,city,state,zip_code)