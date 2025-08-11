use lesson_dev;

DROP TABLE IF EXISTS user_orders;
DROP TABLE IF EXISTS app_logs;
DROP TABLE IF EXISTS search_logs;
CREATE TABLE IF NOT EXISTS user_orders (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  status ENUM('PAID','PENDING','CANCELLED','REFUND') NOT NULL,
  amount INT NOT NULL,
  note VARCHAR(255),
  coupon_code VARCHAR(100),
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY idx_orders_created (created_at),
  KEY idx_orders_status (status),
  KEY idx_orders_coupon_code (coupon_code),
  KEY idx_orders_user_created (user_id, created_at)
) DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS app_logs (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  level ENUM('INFO','WARN','ERROR') NOT NULL,
  service VARCHAR(100) NOT NULL,
  message TEXT NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY idx_app_logs_level_created (level, created_at),
  KEY idx_app_logs_service_created (service, created_at),
  KEY idx_app_logs_created (created_at)
) DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS search_logs (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  query_text VARCHAR(255) NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY idx_search_logs_created (created_at),
  KEY idx_search_logs_user_created (user_id, created_at),
  KEY idx_search_logs_query_text (query_text)
) DEFAULT CHARSET=utf8mb4;


INSERT INTO user_orders (user_id, status, amount, note, coupon_code, created_at) VALUES
(101,'PAID',30000,'첫구매 10% 할인','SAVE_10','2025-08-10 10:00:00'),
(101,'REFUND',-30000,'환불 처리 완료','SAVE_10','2025-08-10 12:00:00'),
(102,'PAID',120000,'EVT 진행중','EVT50_2025','2025-08-11 09:00:00'),
(103,'PAID',50000,'노트 50% 적용','SAVE_50','2025-08-11 10:20:00'),
(101,'PAID',70000,'노트: %와 _ 테스트','SAVE_20','2025-08-11 11:00:00'),
(102,'CANCELLED',0,'취소됨','SAVE_20','2025-08-11 12:00:00'),
(104,'PAID',45000,'정상 결제','WELCOME','2025-08-09 22:00:00'),
(103,'PAID',80000,'EVT 특가','EVTSPRING_2025','2025-08-11 13:30:00'),
(103,'PENDING',0,'대기중','SAVE_10','2025-08-12 09:00:00'),
(105,'PAID',65000,'완료 100%','EVTVIP_2025','2025-08-11 14:05:00'),
(106,'PAID',90000,'여름 세일 30%','EVT_2025','2025-08-10 16:40:00'),
(102,'PAID',40000,'쿠폰 적용','SAVE_FREE','2025-08-11 09:15:00'),
(104,'PAID',30000,'메모: %기호 있음','SAVE_XY','2025-08-11 10:05:00'),
(105,'PAID',120000,'노트 _기호 포함','EVTFLASH_2025','2025-08-11 10:10:00'),
(101,'PAID',35000,'일반 결제','BLACKFRIDAY','2025-08-11 10:12:00'),
(102,'PAID',75000,'추가 구매','EVT50_2025','2025-08-11 11:20:00'),
(103,'REFUND',-50000,'부분 환불 50%','SAVE_50','2025-08-11 12:10:00'),
(104,'PAID',52000,'쿠폰 테스트 %_','SAVE_10','2025-08-11 12:30:00'),
(106,'PENDING',0,'준비중','SAVE_20','2025-08-11 12:40:00'),
(105,'CANCELLED',0,'사용자 취소','EVTVIP_2025','2025-08-11 12:55:00'),
(101,'PAID',115000,'EVT 참여','EVTSPRING_2025','2025-08-11 13:00:00'),
(102,'PAID',68000,'일반 결제','WELCOME','2025-08-11 13:05:00'),
(103,'PAID',99000,'특가 10%','EVT50_2025','2025-08-11 13:20:00'),
(104,'PAID',20000,'메모: 언더스코어_테스트','SAVE_20','2025-08-11 13:25:00'),
(105,'PAID',88000,'메모: 75% 할인','EVT_2025','2025-08-11 13:40:00'),
(106,'PAID',43000,'쿠폰 없음','WELCOME','2025-08-11 13:45:00'),
(101,'PAID',57000,'% 표시 포함','SAVE_10','2025-08-11 14:10:00'),
(102,'PAID',61000,'_ 포함 메모','SAVE_20','2025-08-11 14:15:00'),
(103,'PAID',72000,'EVT 마감 임박','EVTVIP_2025','2025-08-11 14:20:00'),
(104,'PAID',83000,'추가 결제','EVTFLASH_2025','2025-08-11 14:25:00'),
(105,'REFUND',-88000,'전액 환불 100%','EVT_2025','2025-08-11 15:00:00');

INSERT INTO app_logs (level, service, message, created_at) VALUES
('ERROR','payments','Payment failed: threshold 85% exceeded','2025-08-11 10:10:00'),
('ERROR','search','pattern __debug__ flag set','2025-08-11 11:00:00'),
('ERROR','api-gateway','Header X-Rate-Limit 100%','2025-08-10 09:00:00'),
('ERROR','auth','Invalid token %ERROR% format','2025-08-09 12:00:00'),
('WARN','orders','Slow query on orders list','2025-08-09 13:30:00'),
('INFO','search','cache warmed','2025-08-09 14:00:00'),
('ERROR','orders','Coupon SAVE_10 not found','2025-08-11 12:05:00'),
('ERROR','payments','DB timeout on EVTSPRING_2025','2025-08-11 12:10:00'),
('ERROR','search','query contained literal % and _','2025-08-11 12:20:00'),
('INFO','api-gateway','healthcheck ok','2025-08-11 12:30:00'),
('ERROR','auth','backslash in path \\login caused 400','2025-08-11 12:40:00'),
('WARN','payments','retry scheduled','2025-08-11 12:50:00'),
('ERROR','orders','double underscore in route /v1/__internal__','2025-08-11 13:00:00'),
('ERROR','search','ranker spilled to disk 95%','2025-08-11 13:05:00'),
('INFO','orders','batch settled','2025-08-11 13:10:00'),
('ERROR','api-gateway','upstream 502 on /EVT%_2025','2025-08-11 13:20:00'),
('ERROR','payments','charge declined','2025-08-11 13:25:00'),
('WARN','auth','token near expiry','2025-08-11 13:30:00'),
('ERROR','search','regex __alpha__ failed','2025-08-11 13:35:00'),
('INFO','payments','settlement ok','2025-08-11 13:40:00');

INSERT INTO search_logs (user_id, query_text, created_at) VALUES
(201,'ios_app','2025-08-11 09:00:00'),
(202,'ios_beta','2025-08-11 09:05:00'),
(203,'ios_pro','2025-08-11 09:10:00'),
(204,'ios_tools','2025-08-11 09:12:00'),
(205,'ver123','2025-08-11 09:20:00'),
(206,'verABC','2025-08-11 09:25:00'),
(207,'ver가나A','2025-08-11 09:28:00'),
(208,'sale%off','2025-08-11 09:30:00'),
(209,'user_name_1','2025-08-11 09:35:00'),
(210,'100% 완료','2025-08-11 09:40:00'),
(201,'ios_alpha','2025-08-11 10:00:00'),
(202,'ios_admin','2025-08-11 10:05:00'),
(203,'ios_archive','2025-08-11 10:10:00'),
(204,'ios_ai','2025-08-11 10:12:00'),
(205,'verXYZ','2025-08-11 10:15:00'),
(206,'ver000','2025-08-11 10:18:00'),
(207,'ver한글Z','2025-08-11 10:20:00'),
(208,'discount_10','2025-08-11 10:22:00'),
(209,'save_guide','2025-08-11 10:24:00'),
(210,'literal_%_test','2025-08-11 10:26:00'),
(201,'ios_dev','2025-08-11 11:00:00'),
(202,'ios_ops','2025-08-11 11:05:00'),
(203,'ios_docs','2025-08-11 11:10:00'),
(204,'ios_demo','2025-08-11 11:12:00'),
(205,'ver111','2025-08-11 11:15:00'),
(206,'ver222','2025-08-11 11:18:00'),
(207,'ios_','2025-08-11 11:20:00'),
(208,'price%index','2025-08-11 11:22:00'),
(209,'under__score','2025-08-11 11:24:00'),
(210,'ios_tools_pro','2025-08-11 11:26:00');

