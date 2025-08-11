use lesson_dev;
DROP TABLE IF EXISTS demo_like;
CREATE TABLE demo_like (
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(100) NOT NULL,
  cntn  VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO demo_like (title, cntn) VALUES
('A', '100% 완료'),
('B', 'user_name_1'),
('C', '할인 50%_적용'),
('D', '% 시작 기호'),
('E', '언더스코어_기호'),
('F', '퍼센트%및_언더스코어_혼합'),
('G', '일반 텍스트'),
('H', '50%'),
('I', '문자_%_조합'),
('J', '리터럴\\백슬래시'),
('K', '백슬래시\\와 %를 조회');

select * from demo_like;

select * from demo_like
WHERE cntn LIKE '%\\%%' ESCAPE '\\';

SELECT id, title, cntn
FROM demo_like
WHERE cntn LIKE '%\\%\\___' ESCAPE '\\';

select * from demo_like where cntn like '%!\\%' ESCAPE '!';
SELECT * FROM demo_like WHERE cntn LIKE '%!%%' ESCAPE '!';
SELECT * FROM demo_like WHERE cntn LIKE '%!%!_%' ESCAPE '!';

