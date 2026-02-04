# Denormalization ⚡

### Definition
The process of trying to improve the read performance of a database by grouping data or adding redundant copies of data.

### Pros
- Faster SELECT queries (fewer JOINs).
- Simpler queries for the backend.
- Better for Data Warehousing and Dashboards.

### Cons
- Slower INSERT/UPDATE/DELETE.
- Data Inconsistency risk (Old data might stay in redundant columns).
- Increased disk space usage.

### Node.js Strategy
Use Triggers or Transactions to ensure that when the "Original" data changes, all "Redundant" copies are updated simultaneously.
