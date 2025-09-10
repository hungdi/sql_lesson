-- hw_prepare.sql
-- 학생 테이블
CREATE TABLE students (
  student_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50),
  department VARCHAR(50),
  birthdate DATE,
  grade INT
);

-- 과목 테이블
CREATE TABLE subjects (
  subject_id INT PRIMARY KEY AUTO_INCREMENT,
  subject_name VARCHAR(100),
  department VARCHAR(50)
);

-- 수강 테이블 (학생-과목 연결)
CREATE TABLE enrollments (
  enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
  student_id INT,
  subject_id INT,
  score INT,
  FOREIGN KEY (student_id) REFERENCES students(student_id),
  FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);

-- 샘플 데이터
INSERT INTO students (name, department, birthdate, grade) VALUES
('홍길동', '컴퓨터공학', '2000-05-20', 3),
('김철수', '경영학과', '2001-08-11', 2),
('이영희', '컴퓨터공학', '1999-12-01', 4);

INSERT INTO subjects (subject_name, department) VALUES
('데이터베이스', '컴퓨터공학'),
('마케팅원론', '경영학과'),
('운영체제', '컴퓨터공학');

INSERT INTO enrollments (student_id, subject_id, score) VALUES
(1, 1, 95),
(1, 3, 87),
(2, 2, 78),
(3, 1, 92),
(3, 3, 88);
