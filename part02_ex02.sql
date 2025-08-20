SELECT e.emp_no, e.first_name, e.last_name, t.title
FROM employees e
    INNER JOIN titles t
        ON e.emp_no = t.emp_no
       AND t.to_date = '9999-01-01'
WHERE e.gender = 'M';