-- NOTE: (it's not saved in the database).
-- You can define several "temporary tables" in one go, separated by a comma.
WITH 
    High_Earners AS (
        SELECT * FROM employees WHERE salary > 10000
    ),
    Bonus_List AS (
        SELECT * FROM bonuses WHERE year = 2024
    )
SELECT h.name, b.amount
FROM High_Earners h
JOIN Bonus_List b ON h.id = b.emp_id;
