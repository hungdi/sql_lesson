-- 1
CREATE VIEW student_info AS
SELECT name, department
FROM students;

SELECT * FROM student_info;


-- 2
CREATE VIEW cs_students AS
SELECT name, grade
FROM students
WHERE department = '컴퓨터공학';

SELECT * FROM cs_students;

-- 3
CREATE VIEW subject_avg AS
SELECT sub.subject_name,
       ROUND(AVG(e.score), 2) AS avg_score
FROM subjects sub
JOIN enrollments e ON sub.subject_id = e.subject_id
GROUP BY sub.subject_name;

SELECT * FROM subject_avg;


-- 4
CREATE VIEW high_scorers AS
SELECT s.name, sub.subject_name, e.score
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN subjects sub ON e.subject_id = sub.subject_id
WHERE e.score >= 90;

SELECT * FROM high_scorers;
