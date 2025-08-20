SELECT e.emp_no, e.first_name, e.last_name, de.dept_no
FROM employees e
    INNER JOIN dept_emp de ON e.emp_no = de.emp_no
WHERE de.to_date = '9999-01-01';