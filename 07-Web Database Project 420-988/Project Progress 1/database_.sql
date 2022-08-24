DROP DATABASE IF EXISTS `vanibao`;

CREATE DATABASE IF NOT EXISTS vanibao DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `vanibao`;
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS vb_users;
DROP TABLE IF EXISTS vb_books;
DROP TABLE IF EXISTS vb_address;
DROP TABLE IF EXISTS vb_orders;
DROP TABLE IF EXISTS vb_order_book;
DROP TABLE IF EXISTS vb_shoppingcart;
DROP TABLE IF EXISTS vb_browse_log;
DROP TABLE IF EXISTS vb_category;
DROP TABLE IF EXISTS vb_news;


CREATE TABLE vb_users (
    user_id INT(9) PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(30),
    full_name VARCHAR(30),
    password VARCHAR(30),
    email VARCHAR(30),
    phone VARCHAR(20),
    head_img VARCHAR(60),
    address1_id INT(9),
    address2_id INT(9),
    address3_id INT(9));

CREATE TABLE vb_address (
    address_id INT(9) PRIMARY KEY AUTO_INCREMENT,
    user_id INT(9),
    full_name VARCHAR(60),
    phone VARCHAR(20),
    addr_street VARCHAR(60),
    addr_city VARCHAR(60),
    addr_province VARCHAR(60),
    postal_code VARCHAR(60),
    FOREIGN KEY (user_id) REFERENCES vb_users(user_id));

CREATE TABLE vb_category (
    id INT(9) PRIMARY KEY AUTO_INCREMENT,
    category VARCHAR(30));

CREATE TABLE vb_auther (
    id INT(9) PRIMARY KEY AUTO_INCREMENT,
    auther VARCHAR(60),
    detail VARCHAR(200));

CREATE TABLE vb_publisher (
    id INT(9) PRIMARY KEY AUTO_INCREMENT,
    publisher VARCHAR(60),
    detail VARCHAR(200));

CREATE TABLE vb_books (
    book_id INT(9) PRIMARY KEY AUTO_INCREMENT,
    book_name VARCHAR(60),
    category_id INT(9),
    keywords VARCHAR(100),
    auther_id INT(9),
    publisher_id INT(9),
    language VARCHAR(30),
    edtion VARCHAR(30),
    isbn VARCHAR(30),
    book_price DOUBLE(9,2),
    book_summary VARCHAR(500),
    book_descrip VARCHAR(900),
    book_img1 VARCHAR(60),
    book_img2 VARCHAR(60),
    book_img3 VARCHAR(60),
    book_img4 VARCHAR(60),
    FOREIGN KEY (category_id) REFERENCES vb_category(id),
    FOREIGN KEY (auther_id) REFERENCES vb_auther(id),
    FOREIGN KEY (publisher_id) REFERENCES vb_publisher(id));

CREATE TABLE vb_orders (
    order_id INT(9) PRIMARY KEY AUTO_INCREMENT,
    order_num VARCHAR(30),
    user_id INT(9),
    order_status VARCHAR(10),
    create_date DATETIME,
    payment_date DATETIME,
    ship_date DATETIME,
    order_tax DOUBLE(9,2),
    order_price DOUBLE(9,2),
    books_count INT(3),
    address_id INT(9),
    ship_fee DOUBLE(9,2),
    paidoff BOOLEAN,
    shipped BOOLEAN,
    FOREIGN KEY (user_id) REFERENCES vb_users(user_id),
    FOREIGN KEY (address_id) REFERENCES vb_address(address_id));

CREATE TABLE vb_order_book (
    id INT(9) PRIMARY KEY AUTO_INCREMENT,
    order_id INT(9),
    book_id INT(9),
    book_name VARCHAR(60),
    book_price DOUBLE(9,2),
    book_count INT(3),
    FOREIGN KEY (order_id) REFERENCES vb_orders(order_id),
    FOREIGN KEY (book_id) REFERENCES vb_books(book_id));

CREATE TABLE vb_shoppingcart (
    id INT(9) PRIMARY KEY AUTO_INCREMENT,
    order_num VARCHAR(30),
    user_id INT(9),
    book_id INT(9),
    book_count INT(3),
    book_price DOUBLE(9,2),
    instock BOOLEAN,
    FOREIGN KEY (user_id) REFERENCES vb_users(user_id),
    FOREIGN KEY (book_id) REFERENCES vb_books(book_id));

CREATE TABLE vb_browse_log (
    id INT(9) PRIMARY KEY AUTO_INCREMENT,
    user_id INT(9),
    browse_date DATETIME,
    book_id INT(9),
    book_name VARCHAR(60),
    FOREIGN KEY (user_id) REFERENCES vb_users(user_id),
    FOREIGN KEY (book_id) REFERENCES vb_books(book_id));


CREATE TABLE vb_news (
    news_id INT(9) PRIMARY KEY AUTO_INCREMENT,
    news_title VARCHAR(200),
    publish_date  DATETIME,
    auther VARCHAR(80),
    news_content VARCHAR(200));
