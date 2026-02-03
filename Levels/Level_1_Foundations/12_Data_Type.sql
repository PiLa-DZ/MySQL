-- == Numeric Types ========================================
-- == 1. INT             --> Use for (ID, Age, Quantity)
-- == 2. BIGINT          --> Use for (Global Phone Numbers, Population census)
-- == 3. DECIMAL(p, s)   --> Use for (Money, Currencies)
-- == 4. BOOLEAN         --> Use for (tree, false)

-- == String Types =========================================
-- == 1. CHAR(size)    : Fixed length    --> Use for (ISO, DZ, US)
-- == 2. VARCHAR(size) : Variable length --> Use for (Text, Name, Email)

-- == Date & Time ==========================================
-- == 1. DATE
-- == 2. TIME
-- == 3. DATETIME
-- == 4. TIMESTAMP      --> Use for (UpdateAt)
-- Create New Table For Test
CREATE TABLE test(
    my_date DATE,
    my_time TIME,
    my_datetime DATETIME,
    deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Add Date To The Table
INSERT INTO test VALUES(CURRENT_DATE(), CURRENT_TIME(), NOW());
-- You Can Also
INSERT INTO test VALUES(CURRENT_DATE() + 1, NULL, NULL);
-- You Can Also
INSERT INTO test VALUES(CURRENT_DATE() + -1, NULL, NULL);
-- == ======================================================
