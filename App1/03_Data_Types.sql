-- == Date And Time ========================================
-- Create New Table For Test
CREATE TABLE test(
    my_date DATE,
    my_time TIME,
    my_datetime DATETIME
);
-- Add Date To The Table
INSERT INTO test VALUES(CURRENT_DATE(), CURRENT_TIME(), NOW());
-- You Can Also
INSERT INTO test VALUES(CURRENT_DATE() + 1, NULL, NULL);
-- You Can Also
INSERT INTO test VALUES(CURRENT_DATE() + -1, NULL, NULL);
-- == ======================================================
