-- employees 테이블
SELECT employee_name FROM employees
UNION ALL
-- contractors 테이블
SELECT contractor_name FROM contractors;


SELECT employee_name FROM employees
UNION
-- contractors 테이블
SELECT contractor_name FROM contractors;
