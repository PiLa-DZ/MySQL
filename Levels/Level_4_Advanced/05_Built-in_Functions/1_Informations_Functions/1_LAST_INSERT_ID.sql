-- == Built-in MySQL Function ==============================
-- It acts like a "global memory" that remembers 
-- the most recent AUTO_INCREMENT ID generated 
-- by your current connection.
select LAST_INSERT_ID() as Last_Inser_ID;
