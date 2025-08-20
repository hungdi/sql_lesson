SELECT d1.dept_no, d1.emp_no AS prev_mgr, d2.emp_no AS next_mgr, d1.to_date AS handover_date
FROM dept_manager d1
    INNER JOIN dept_manager d2
        ON d1.dept_no = d2.dept_no
       AND d1.to_date = d2.from_date;