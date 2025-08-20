DROP DATABASE IF EXISTS idx_lab;
CREATE DATABASE idx_lab;
USE idx_lab;

CREATE TABLE departments (
  dept_no CHAR(4) PRIMARY KEY,
  dept_name VARCHAR(64) NOT NULL
) ENGINE=InnoDB;

INSERT INTO departments VALUES
('d001','Marketing'),('d002','Finance'),('d003','HR'),
('d004','Production'),('d005','Development'),('d006','Quality'),
('d007','Sales'),('d008','Research'),('d009','Customer Service');

CREATE TABLE employees_big (
  emp_id     INT NOT NULL AUTO_INCREMENT,
  dept_no    CHAR(4) NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name  VARCHAR(50) NOT NULL,
  hire_date  DATE NOT NULL,
  salary     INT NOT NULL,
  email      VARCHAR(120) NOT NULL,
  status     ENUM('ACTIVE','INACTIVE') NOT NULL,
  PRIMARY KEY (emp_id)
) ENGINE=InnoDB;

SET SESSION cte_max_recursion_depth = 500000;

INSERT INTO employees_big (dept_no, first_name, last_name, hire_date, salary, email, status)
WITH RECURSIVE seq AS (
  SELECT 1 AS n
  UNION ALL
  SELECT n+1 FROM seq WHERE n < 200000
)
SELECT
  ELT(1 + (n % 9),'d001','d002','d003','d004','d005','d006','d007','d008','d009'),
  CONCAT('First', n % 1000),
  ELT(1 + (n % 10),'Smith','Kim','Lee','Park','Choi','Garcia','Miller','Brown','Wilson','Davis'),
  DATE_ADD('2000-01-01', INTERVAL (n % 9000) DAY),
  30000 + (n % 70000),
  CONCAT('user', n, '@example.com'),
  IF(n % 17 = 0, 'INACTIVE','ACTIVE')
FROM seq;

CREATE TABLE emp_activity_log (
  emp_id     INT NOT NULL,
  event_date DATE NOT NULL,
  event_type ENUM('LOGIN','LOGOUT','VIEW','EDIT','APPROVE') NOT NULL,
  KEY idx_event_date (event_date),
  KEY idx_emp (emp_id)
) ENGINE=InnoDB;

INSERT INTO emp_activity_log (emp_id, event_date, event_type)
WITH RECURSIVE s2 AS (
  SELECT 1 AS n
  UNION ALL
  SELECT n+1 FROM s2 WHERE n < 400000
)
SELECT
  1 + (n % 200000),
  DATE_ADD('2024-01-01', INTERVAL (n % 365) DAY),
  ELT(1 + (n % 5),'LOGIN','LOGOUT','VIEW','EDIT','APPROVE')
FROM s2;

