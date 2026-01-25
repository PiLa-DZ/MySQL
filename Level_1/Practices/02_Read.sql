-- == Summary ==============================================
-- 1. Read (All  Columns) and (All Rows) -------------------
-- 2. Read (All  Columns) and (One Row ) -------------------
-- 3. Read (Many Columns) and (All Rows) -------------------
-- 4. Read (Many Columns) and (One Row ) -------------------
-- 5. Read (One  Column ) and (All Rows) -------------------
-- 6. Read (One  Column ) and (One Row ) -------------------

SELECT *                FROM workers              ;
SELECT *                FROM workers WHERE id = 1 ;
SELECT id, name, age    FROM workers              ;
SELECT id, name, salary FROM workers WHERE id = 1 ;
SELECT name             FROM workers              ;
SELECT name             FROM workers WHERE id = 1 ;

-- 1. Read (All  Columns) and (All Rows) -------------------
SELECT * FROM workers;
-- +------+------+------+---------+
-- | id   | name | age  | salary  |
-- +------+------+------+---------+
-- |    1 | Amir |   22 | 8500.00 |
-- |    2 | Sara |   25 | 9320.00 |
-- |    3 | Jol  |   34 | 2000.00 |
-- |    4 | Ani  |   18 | 1200.00 |
-- |    5 | Mona |   22 | 7100.00 |
-- +------+------+------+---------+

-- 2. Read (All  Columns) and (One Row ) -------------------
SELECT * FROM workers WHERE id = 1;
-- +------+------+------+---------+
-- | id   | name | age  | salary  |
-- +------+------+------+---------+
-- |    1 | Amir |   22 | 8500.00 |
-- +------+------+------+---------+

-- 3. Read (Many Columns) and (All Rows) -------------------
SELECT id, name, age FROM workers;
-- +------+------+------+
-- | id   | name | age  |
-- +------+------+------+
-- |    1 | Amir |   22 |
-- |    2 | Sara |   25 |
-- |    3 | Jol  |   34 |
-- |    4 | Ani  |   18 |
-- |    5 | Mona |   22 |
-- +------+------+------+

-- 4. Read (Many Columns) and (One Row ) -------------------
SELECT id, name, salary FROM workers WHERE id = 1;
-- +------+------+---------+
-- | id   | name | salary  |
-- +------+------+---------+
-- |    1 | Amir | 8500.00 |
-- +------+------+---------+

-- 5. Read (One  Column ) and (All Rows) -------------------
SELECT name FROM workers;
-- +------+
-- | name |
-- +------+
-- | Amir |
-- | Sara |
-- | Jol  |
-- | Ani  |
-- | Mona |
-- +------+

-- 6. Read (One  Column ) and (One Row ) -------------------
SELECT name FROM workers WHERE id = 1;
-- +------+
-- | name |
-- +------+
-- | Amir |
-- +------+
