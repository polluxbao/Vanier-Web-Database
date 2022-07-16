--1. Based on the below schema and the *.csv files (given compressed as PR_data.zip
--in Lea document list) create the corresponding database tables and load the data 
--from data.sql file into the database. Describe the method used (SQL Loader, 
--Java/Python scripts, Excel, …)


CREATE TABLE pr_brands (
    brand_id	INT not null,
    brand_name  VARCHAR2(40)
);

CREATE TABLE pr_categories (
    category_id	INT not null,
    category_name VARCHAR2(40)
);

CREATE TABLE pr_customers (
    customer_id	INT not null,
    first_name	VARCHAR2(40),
    last_name	VARCHAR2(40),
    phone	VARCHAR2(20) null,
    email	VARCHAR2(40),
    street	VARCHAR2(40),
    city	VARCHAR2(40),
    state	VARCHAR(2),
    zip_code NUMBER(5)
);

CREATE TABLE pr_order_items (
    order_id	INT not null,
    item_id	    INT,
    product_id	INT,
    quantity	INT,
    list_price	NUMBER(*,2),
    discount    NUMBER(3,2)
);

CREATE TABLE pr_orders (
    order_id	    INT not null,
    customer_id	    INT,
    order_status	INT,
    order_date	    VARCHAR(40),
    required_date	VARCHAR(40),
    shipped_date	VARCHAR(40),
    store_id	    INT,
    staff_id        INT
);

CREATE TABLE pr_products (
    product_id	    INT not null,
    product_name	VARCHAR2(80),
    brand_id	    INT,
    category_id	    INT,
    model_year	    VARCHAR(4),
    list_price      NUMBER
);

CREATE TABLE pr_staffs (
    staff_id	INT not null,
    first_name	VARCHAR2(40),
    last_name	VARCHAR2(40),
    email	    VARCHAR2(40),
    phone	    VARCHAR2(20),
    active	    INT,
    store_id	INT,
    manager_id  VARCHAR2(4)
);

CREATE TABLE pr_stocks (
    store_id	INT not null,
    product_id	INT,
    quantity    INT
);

CREATE TABLE pr_stores (
    store_id	INT not null,
    store_name	VARCHAR2(40),
    phone	    VARCHAR2(40),
    email	    VARCHAR2(40),
    street	    VARCHAR2(40),
    city	    VARCHAR2(40),
    state	    VARCHAR(2),
    zip_code    NUMBER(5)
);

ALTER TABLE pr_brands ADD CONSTRAINT pk_brands_id PRIMARY KEY (brand_id);
ALTER TABLE pr_categories ADD CONSTRAINT pk_category_id PRIMARY KEY (category_id);
ALTER TABLE pr_customers ADD CONSTRAINT pk_customer_id PRIMARY KEY (customer_id);
--ALTER TABLE pr_order_items ADD CONSTRAINT pk_order_items_id PRIMARY KEY (order_id);
ALTER TABLE pr_products ADD CONSTRAINT pk_product_id PRIMARY KEY (product_id);
ALTER TABLE pr_orders ADD CONSTRAINT pk_order_id PRIMARY KEY (order_id);
ALTER TABLE pr_staffs ADD CONSTRAINT pk_staff_id PRIMARY KEY (staff_id);
ALTER TABLE pr_stores ADD CONSTRAINT pk_store_id PRIMARY KEY (store_id);

ALTER TABLE pr_order_items ADD CONSTRAINT fk_product_id FOREIGN KEY (product_id) 
    REFERENCES pr_products(product_id);
    
ALTER TABLE pr_orders ADD CONSTRAINT fk_customer_id FOREIGN KEY (customer_id)
    REFERENCES pr_customers(customer_id);
--ALTER TABLE pr_orders ADD CONSTRAINT fk_orders_store_id FOREIGN KEY (store_id)
--    REFERENCES pr_stores(store_id);
ALTER TABLE pr_orders ADD CONSTRAINT fk_staff_id FOREIGN KEY (staff_id)
    REFERENCES pr_staffs(staff_id);
    
ALTER TABLE pr_products ADD CONSTRAINT fk_brand_id FOREIGN KEY (brand_id) 
    REFERENCES pr_brands(brand_id);
ALTER TABLE pr_products ADD CONSTRAINT fk_category_id FOREIGN KEY (category_id) 
    REFERENCES pr_categories(category_id);
    
--ALTER TABLE pr_staffs ADD CONSTRAINT fk_staffs_store_id FOREIGN KEY (store_id)
--    REFERENCES pr_stores(store_id);
    
--ALTER TABLE pr_staffs ADD CONSTRAINT fk_manager_id FOREIGN KEY (manager_id)
--    REFERENCES pr_staffs(staff_id);

ALTER TABLE pr_stocks ADD CONSTRAINT fk_stocks_product_id FOREIGN KEY (product_id)
    REFERENCES pr_products(product_id);

DROP TABLE pr_stores;
DROP TABLE pr_stocks;
DROP TABLE pr_staffs;
DROP TABLE pr_products;
DROP TABLE pr_order_items;
DROP TABLE pr_orders;
DROP TABLE pr_customers;
DROP TABLE pr_categories;
DROP TABLE pr_brands;




