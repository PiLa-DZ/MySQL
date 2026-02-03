-- What makes a View "Non-Updatable"?
-- If your View contains any of the following, you can only READ from it:

-- 1. Aggregate Functions: SUM(), MIN(), MAX(), COUNT(), etc.
-- 2. Grouping: GROUP BY or HAVING.
-- 3. Distinct: SELECT DISTINCT.
-- 4. Unions: UNION or UNION ALL.
-- 5. Joins: (Some joins are updatable, but usually only if you update a single base table and the mapping is 1:1).
