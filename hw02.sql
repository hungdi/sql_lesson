CREATE DATABASE IF NOT EXISTS lesson_dev05
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_general_ci;

USE lesson_dev05;

DROP TABLE IF EXISTS product_sales;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS categories;

CREATE TABLE categories (
  category_id INT PRIMARY KEY,
  category_name VARCHAR(50)
);

CREATE TABLE products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(50),
  category_id INT,
  price DECIMAL(12,2)
);

CREATE TABLE product_sales (
  sale_id INT PRIMARY KEY,
  product_id INT,
  sale_date DATE,
  qty INT,
  unit_price DECIMAL(12,2)
);

INSERT INTO categories VALUES
(1,'전자'), (2,'주방'), (3,'도서');

INSERT INTO products VALUES
(1,'노트북',1,1500000),
(2,'이어폰',1,120000),
(7,'모니터',1,300000),
(3,'전자레인지',2,200000),
(4,'프라이팬',2,50000),
(5,'소설책',3,15000),
(6,'요리책',3,22000);

INSERT INTO product_sales VALUES
(1001,1,'2024-07-01',2,1500000),
(1002,2,'2024-07-01',5,120000),
(1003,3,'2024-07-02',3,200000),
(1007,6,'2024-07-02',5,22000),
(1004,7,'2024-07-03',4,300000),
(1005,4,'2024-07-03',10,50000),
(1006,5,'2024-07-03',20,15000),
(1008,2,'2024-07-04',8,110000);