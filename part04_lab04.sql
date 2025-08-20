-- P1: leading column 미사용 (복합 인덱스를 쓸 수 없음
EXPLAIN ANALYZE
SELECT SQL_NO_CACHE emp_id, dept_no, hire_date
FROM employees_big
WHERE hire_date BETWEEN '2010-01-01' AND '2015-12-31'
ORDER BY hire_date;

-- P2: 함수/표현식 사용 (칼럼 가공 시 인덱스 사용 저해)
EXPLAIN ANALYZE
SELECT SQL_NO_CACHE emp_id
FROM employees_big
WHERE YEAR(hire_date) = 2012;  -- 가공 대신 범위를 쓰는게 좋음

-- P3: 앞에 와일드카드 LIKE (prefix가 아니면 인덱스 거의 불가)
EXPLAIN ANALYZE
SELECT SQL_NO_CACHE emp_id
FROM employees_big
WHERE last_name LIKE '%mith';  -- '%...' 형태는 인덱스 미사용