CROSS JOIN  -- is about multiplying every row by every other row. ( Rows  *  Rows )
UNION       -- is about stacking rows on top of each other.       ((Rows) + (Rows))
FULL JOIN   -- is about matching rows side-by-side.               ( Rows --> Rows )

-- Syntax Tip
-- In MySQL, these three commands do the exact same thing:
SELECT * FROM TableA CROSS JOIN TableB;
SELECT * FROM TableA JOIN TableB; -- A JOIN without an 'ON' clause defaults to CROSS
SELECT * FROM TableA, TableB;     -- The old "Comma" style
