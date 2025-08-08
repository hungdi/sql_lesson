USE employees;

-- START OF load_employees.dump
INSERT INTO employees VALUES (10001,'1953-09-02','Georgi','Facello','M','1986-06-26');
INSERT INTO employees VALUES (10002,'1964-06-02','Bezalel','Simmel','F','1985-11-21');
INSERT INTO employees VALUES (10003,'1959-12-03','Parto','Bamford','M','1986-08-28');
INSERT INTO employees VALUES (10004,'1954-05-01','Chirstian','Koblick','M','1986-12-01');
INSERT INTO employees VALUES (10005,'1955-01-21','Kyoichi','Maliniak','M','1989-09-12');
INSERT INTO employees VALUES (110022, '1960-01-01', 'Fake', 'Manager', 'M', '1985-01-01');
INSERT INTO employees VALUES (110039, '1955-03-15', 'Temp', 'Manager2', 'F', '1990-01-01');
-- END OF load_employees.dump

-- START OF load_departments.dump
INSERT INTO departments VALUES ('d001','Marketing');
INSERT INTO departments VALUES ('d002','Finance');
INSERT INTO departments VALUES ('d003','Human Resources');
INSERT INTO departments VALUES ('d004','Production');
INSERT INTO departments VALUES ('d005','Development');
INSERT INTO departments VALUES ('d006','Quality Management');
INSERT INTO departments VALUES ('d007','Sales');
INSERT INTO departments VALUES ('d008','Research');
INSERT INTO departments VALUES ('d009','Customer Service');

-- END OF load_departments.dump

-- START OF load_titles.dump
INSERT INTO titles VALUES (10001,'Senior Engineer','1986-06-26','9999-01-01');
INSERT INTO titles VALUES (10002,'Staff','1996-08-03','9999-01-01');
INSERT INTO titles VALUES (10003,'Senior Engineer','1995-12-03','9999-01-01');

-- END OF load_titles.dump

-- START OF load_salaries1.dump
INSERT INTO salaries VALUES (10001,60117,'1986-06-26','1987-06-26');
INSERT INTO salaries VALUES (10002,65828,'1996-08-03','1997-08-03');

-- END OF load_salaries1.dump

-- START OF load_salaries2.dump
INSERT INTO salaries VALUES (10001,62102,'1987-06-26','1988-06-25');

-- END OF load_salaries2.dump

-- START OF load_salaries3.dump
INSERT INTO salaries VALUES (10001,66074,'1988-06-25','1989-06-25');

-- END OF load_salaries3.dump

-- START OF load_dept_emp.dump
INSERT INTO dept_emp VALUES (10001,'d005','1986-06-26','9999-01-01');
INSERT INTO dept_emp VALUES (10002,'d007','1996-08-03','9999-01-01');
INSERT INTO dept_emp VALUES (10003,'d004','1995-12-03','9999-01-01');

-- END OF load_dept_emp.dump

-- START OF load_dept_manager.dump
INSERT INTO dept_manager VALUES (110022,'d001','1985-01-01','1991-10-01');
INSERT INTO dept_manager VALUES (110039,'d001','1991-10-01','9999-01-01');

-- END OF load_dept_manager.dump