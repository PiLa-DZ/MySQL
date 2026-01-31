-- Value Access: LAG() and LEAD() 
-- "Look-back" and "Look-ahead" functions.
-- == ======================================================
-- == Predicting or Peeking at the Next Row ================
DROP TABLE IF EXISTS user_sessions;
CREATE TABLE user_sessions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    page_name VARCHAR(50),
    access_time TIME
);

INSERT INTO user_sessions (user_id, page_name, access_time) VALUES 
(1, 'Home', '10:00:00'),
(1, 'Products', '10:05:00'),
(1, 'Checkout', '10:07:00'),
(1, 'Success', '10:08:00');

-- Use LEAD to see what page the user visited NEXT
SELECT 
    page_name AS current_page,
    access_time AS start_time,
    LEAD(page_name) OVER (ORDER BY access_time) AS next_page,
    LEAD(access_time) OVER (ORDER BY access_time) AS next_page_time
FROM user_sessions
WHERE user_id = 1;
-- +--------------+------------+-----------+----------------+
-- | current_page | start_time | next_page | next_page_time |
-- +--------------+------------+-----------+----------------+
-- | Home         | 10:00:00   | Products  | 10:05:00       |
-- | Products     | 10:05:00   | Checkout  | 10:07:00       |
-- | Checkout     | 10:07:00   | Success   | 10:08:00       |
-- | Success      | 10:08:00   | NULL      | NULL           |
-- +--------------+------------+-----------+----------------+
