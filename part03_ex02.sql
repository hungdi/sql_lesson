SELECT * FROM dept_emp WHERE emp_no = 10001;          -- 인덱스 사용
SELECT * FROM dept_emp WHERE emp_no = 10001 AND dept_no = 'd005'; -- 인덱스 사용
SELECT * FROM dept_emp WHERE dept_no = 'd005';        -- 인덱스 사용 못 함 (단독쿼리)