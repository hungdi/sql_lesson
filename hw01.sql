CREATE TABLE IF NOT EXISTS emp_updates (
  update_id     INT AUTO_INCREMENT PRIMARY KEY,
  emp_no        INT NOT NULL,
  field_name    VARCHAR(50) NOT NULL,
  old_value     VARCHAR(255),
  new_value     VARCHAR(255) NOT NULL,
  requested_at  DATETIME NOT NULL,
  approved_by   INT,
  approved_at   DATETIME,
  status        ENUM('PENDING','APPROVED','REJECTED') NOT NULL,
  KEY idx_emp_updates_empno_requested (emp_no, requested_at),
  KEY idx_emp_updates_approved_by (approved_by)
) DEFAULT CHARSET=utf8mb4;

INSERT INTO emp_updates (emp_no, field_name, old_value, new_value, requested_at, approved_by, approved_at, status) VALUES
(10001, 'last_name', 'Facello', 'Faccello', '2025-06-01 09:10:00', 110039, '2025-06-01 10:00:00', 'APPROVED'),
(10002, 'first_name', 'Bezalel', 'Beza', '2025-06-03 14:20:00', NULL, NULL, 'PENDING'),
(10003, 'dept_no', 'd004', 'd005', '2025-06-05 11:00:00', 110039, '2025-06-05 15:00:00', 'APPROVED'),
(10004, 'title', NULL, 'Staff', '2025-06-10 10:00:00', NULL, NULL, 'PENDING');

-- 2) 부서 연간 예산(연도별 비교/누락 점검 용)
CREATE TABLE IF NOT EXISTS dept_budget (
  dept_no      CHAR(4) NOT NULL,
  fiscal_year  YEAR NOT NULL,
  budget_amount INT NOT NULL,
  PRIMARY KEY (dept_no, fiscal_year)
) DEFAULT CHARSET=utf8mb4;

INSERT INTO dept_budget (dept_no, fiscal_year, budget_amount) VALUES
('d004', 2024, 800000),
('d004', 2025, 880000),
('d005', 2024, 1200000),
('d005', 2025, 1300000),
('d007', 2025, 950000),
('d099', 2025, 500000);

-- 3) 직함-등급 매핑(인사 규정/보상 정책 연계)
CREATE TABLE IF NOT EXISTS title_grade_map (
  title VARCHAR(50) PRIMARY KEY,
  grade VARCHAR(10) NOT NULL
) DEFAULT CHARSET=utf8mb4;

INSERT INTO title_grade_map (title, grade) VALUES
('Senior Engineer', 'G4'),
('Staff', 'G3'),
('Manager', 'G5');

-- 4) 월 캘린더(운영 배치/감사 스케줄 조합용)
CREATE TABLE IF NOT EXISTS month_calendar (
  ym CHAR(7) PRIMARY KEY,
  work_days TINYINT NOT NULL
) DEFAULT CHARSET=utf8mb4;

INSERT INTO month_calendar (ym, work_days) VALUES
('2025-07', 23),
('2025-08', 21),
('2025-09', 22);