-- 스키마(데이터베이스) 생성 및 선택
CREATE SCHEMA lesson_dev06;
USE lesson_dev06;

-- `employees` 테이블 생성
CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(100) NOT NULL
);

-- `contractors` 테이블 생성
CREATE TABLE contractors (
    contractor_id INT PRIMARY KEY AUTO_INCREMENT,
    contractor_name VARCHAR(100) NOT NULL
);

-- `employees` 테이블에 데이터 삽입
INSERT INTO employees (employee_name) VALUES
('김철수'),
('박영희'),
('이민호'),
('김영숙');

-- `contractors` 테이블에 데이터 삽입
INSERT INTO contractors (contractor_name) VALUES
('김철수'),
('최지민'),
('박서준');

-- `online_orders` 테이블 생성
CREATE TABLE online_orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total_price DECIMAL(10, 2)
);

-- `offline_orders` 테이블 생성
CREATE TABLE offline_orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total_price DECIMAL(10, 2)
);

-- `online_orders` 테이블에 데이터 삽입
INSERT INTO online_orders (customer_id, order_date, total_price) VALUES
(101, '2025-01-05', 50000.00),
(102, '2025-01-15', 35000.00),
(103, '2025-02-01', 75000.00);

-- `offline_orders` 테이블에 데이터 삽입
INSERT INTO offline_orders (customer_id, order_date, total_price) VALUES
(201, '2025-01-10', 60000.00),
(202, '2025-01-20', 45000.00),
(203, '2025-02-05', 90000.00);


-- `students` 테이블 생성
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL,
    score INT NOT NULL
);

-- `students` 테이블에 데이터 삽입
INSERT INTO students (student_name, score) VALUES
('이지은', 95),
('박서연', 88),
('김민준', 72),
('최유리', 65),
('정재현', 45);


-- `products` 테이블 생성
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    stock_quantity INT NOT NULL
);

-- `products` 테이블에 데이터 삽입
INSERT INTO products (product_name, stock_quantity) VALUES
('노트북', 15),
('스마트폰', 5),
('헤드폰', 0),
('키보드', 20),
('마우스', 10),
('모니터', 0),
('웹캠', 8);