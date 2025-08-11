use lesson_dev;
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  status ENUM('PAID','PENDING','CANCELLED','REFUND') NOT NULL,
  amount INT NOT NULL,
  created_at DATETIME NOT NULL,
  KEY idx_orders_user_created (user_id, created_at),
  KEY idx_orders_created (created_at),
  KEY idx_orders_status (status)
) DEFAULT CHARSET=utf8mb4;

INSERT INTO orders (user_id, status, amount, created_at) VALUES
(101,'PAID',     30000,'2025-08-10 10:00:00'),
(101,'REFUND',  -30000,'2025-08-10 12:00:00'),
(102,'PAID',    120000,'2025-08-11 09:00:00'),
(103,'PAID',     50000,'2025-08-11 10:20:00'),
(101,'PAID',     70000,'2025-08-11 11:00:00'),
(102,'CANCELLED',    0,'2025-08-11 12:00:00'),
(104,'PAID',     45000,'2025-08-09 22:00:00'),
(103,'PAID',     80000,'2025-08-11 13:30:00'),
(103,'PENDING',      0,'2025-08-12 09:00:00');
