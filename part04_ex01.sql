SELECT e.emp_no, e.first_name, d.dept_no, d.dept_name
FROM employees e
    CROSS JOIN departments d
WHERE e.emp_no IN (10001, 10002)
  AND d.dept_no IN ('d001','d002','d003');