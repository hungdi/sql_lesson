SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM employees e
    LEFT JOIN dept_emp de ON e.emp_no = de.emp_no AND de.to_date = '9999-01-01'
    LEFT JOIN departments d ON d.dept_no = de.dept_no
WHERE e.gender = 'F';