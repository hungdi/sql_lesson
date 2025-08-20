-- S1) 단일 인덱스: last_name (Q1 가속)
CREATE INDEX idx_employees_lastname ON employees_big(last_name);

-- S2) 복합 인덱스: (dept_no, hire_date) (Q2·Q3 가속)
CREATE INDEX idx_employees_dept_hire ON employees_big(dept_no, hire_date);

-- S3) 커버링 인덱스: (dept_no, hire_date, emp_id)   -- Q2 ORDER BY까지 커버 가능성
CREATE INDEX idx_employees_dept_hire_emp ON employees_big(dept_no, hire_date, emp_id);

-- S4) 조인 강화를 위한 보조 인덱스(이미 emp_activity_log(emp_id) 있음. employees_big PK(emp_id)도 존재)
-- 조인 조건은 이미 인덱스 친화적이므로 Q4는 event_date 조건 강화가 핵심
CREATE INDEX idx_log_event_date_type ON emp_activity_log(event_date, emp_id);