-- part04_lab02.sql
-- Q1: 성(last_name) 정확히 매칭 (집중된 분포: 'Smith'), 0.109 sec / 0.016 sec
SELECT SQL_NO_CACHE emp_id, last_name
FROM employees_big
WHERE last_name = 'Smith';

-- Q2: 특정 부서 + 입사일 범위 (정렬 포함), 0.140 sec / 0.015 sec
SELECT SQL_NO_CACHE emp_id, dept_no, hire_date
FROM employees_big
WHERE dept_no = 'd005'
  AND hire_date BETWEEN '2010-01-01' AND '2015-12-31'
ORDER BY hire_date;

-- Q3: 활동 로그와 조인(최근 30일), 0.015 sec
SELECT SQL_NO_CACHE e.emp_id, e.dept_no, l.event_type
FROM employees_big e
JOIN emp_activity_log l
  ON e.emp_id = l.emp_id
WHERE l.event_date >= CURRENT_DATE - INTERVAL 30 DAY;
