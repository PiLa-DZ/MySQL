-- == Simple Example =======================================
DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    vote INT
);
insert into users (name, vote) values 
('a', 3), 
('b', 5),
('c', 2), 
('d', 2), 
('e', 1);
-- -- ------------------------------------------------------
select a.name AS Name, b.name AS Vote_To
from users a
join users b on a.vote = b.id;
-- +------+---------+
-- | Name | Vote_To |
-- +------+---------+
-- | a    | c       |
-- | b    | e       |
-- | c    | b       |
-- | d    | b       |
-- | e    | a       |
-- +------+---------+
