/* == ======================================================
-- Why use Stored Procedures? (The Philosophy)
1. Performance
2. Security
3. Consistency)

1. Performance: They are pre-compiled by the server, 
   making them faster than sending raw SQL strings.

2. Security: You can give a developer permission to CALL 
   a procedure without giving them direct access to the 
   tables.

3. Consistency: Business logic (like "Registering a User") 
   is defined in one place.

*/
