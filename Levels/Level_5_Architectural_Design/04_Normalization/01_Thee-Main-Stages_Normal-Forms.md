- Normalization is the mathematical process of 
    - organizing data in a database to reduce 
    - redundancy (repetition) and improve data integrity.
- The Three Main Stages (Normal Forms)
    1. First Normal Form (1NF): Atomicity
        1. The Rule   : Each cell must contain only one value (no lists/arrays).
        2. The Problem: You have a column tags that says "SQL, Web, Dev".
        3. The Fix    : Split them so every row has a single value.
    2. Second Normal Form (2NF): No Partial Dependencies
        1. The Rule   : Must be in 1NF, and every non-key column must depend on the entire Primary Key.
        2. The Problem: In a table with a Composite Key (OrderID, ProductID), if you have a column CustomerName, that name depends only on the OrderID, not the product.
        3. The Fix    : Move CustomerName to an Orders table.
    3. Third Normal Form (3NF): No Transitive Dependencies
        1. The Rule   : Must be in 2NF, and columns should depend only on the Primary Key, not on other non-key columns.
        2. The Problem: A Users table has zip_code and city. city actually depends on zip_code, not directly on the user_id.
        3. The Fix    : Create a Cities table where zip_code is the key.

- Summary:
    1. Goal: One fact in one place.
    2. 1NF : Single values per cell.
    3. 2NF : No partial dependencies.
    4. 3NF : No transitive dependencies.
