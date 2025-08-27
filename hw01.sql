-- hw01.sql
-- 새로운 데이터베이스를 생성해서 사용합니다. (기존의 Orders와 겹치기 때문에)
CREATE DATABASE lesson_dev04
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_general_ci;
  
use lesson_dev04;

-- Customers 테이블 생성
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

-- Orders 테이블 생성
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

-- 데이터 삽입
INSERT INTO customers VALUES (1, '김철수', '서울');
INSERT INTO customers VALUES (2, '박영희', '부산');
INSERT INTO customers VALUES (3, '이민호', '서울');
INSERT INTO customers VALUES (4, '최지영', '대구');

INSERT INTO orders VALUES (101, 1, '2024-07-01', 50000);
INSERT INTO orders VALUES (102, 3, '2024-07-02', 75000);
INSERT INTO orders VALUES (103, 1, '2024-07-03', 120000);
INSERT INTO orders VALUES (104, 2, '2024-07-04', 30000);
INSERT INTO orders VALUES (105, 4, '2024-07-05', 90000);
INSERT INTO orders VALUES (106, 1, '2024-07-03', 80000);
INSERT INTO orders VALUES (107, 1, '2024-07-04', 80000);
INSERT INTO orders VALUES (108, 2, '2024-07-06', 45000);