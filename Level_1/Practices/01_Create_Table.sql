-- == Create Table For Workers =============================
create table workers (
    id INT,
    name VARCHAR(100),
    age INT,
    salary DECIMAL(10, 2)
);

-- == Create Rows For Workers ==============================
INSERT INTO workers (id, name, age, salary) VALUES
-- | id | Name  | Age | Salary |
   ( 1  , "Amir", 22  , 8500.00), 
   ( 2  , "Sara", 25  , 9320.00), 
   ( 3  , "Jol" , 34  , 2000.00),
   ( 4  , "Ani" , 18  , 1200.00),
   ( 5  , "Mona", 22  , 7100.00);
