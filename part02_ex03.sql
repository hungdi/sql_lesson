SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM employees e
    INNER JOIN dept_emp de 
        ON e.emp_no = de.emp_no
       AND de.to_date = '9999-01-01'
    INNER JOIN departments d 
        ON de.dept_no = d.dept_no;