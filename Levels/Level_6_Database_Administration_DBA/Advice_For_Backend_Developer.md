- Advice for a Node.js Backend Developer
    - Since you are using Node.js, here is my "Senior Developer" advice for your career:

    1. Never Hardcode Credentials
        1. Don't put your DB "user" and "password" inside your app.js. 
        2. Use a .env file.
        - Reason: If you push your "password" to GitHub, 
        - hackers will find it in seconds.

    2. Use a Connection Pool
        - Node.js is asynchronous. 
        - If you open a new connection for every single request, 
        - your database will crash when 100 people visit at once.
        - Advice: Use a Pool. 
            - It keeps 10-20 connections "alive" 
            - and reuses them for every request.

    3. SQL Injection is your Enemy #1
        - Never do this: `SELECT * FROM users WHERE id = ${req.body.id}`. 
        - Always use Parameterized Queries:
        ```JavaScript
            // Using mysql2 or similar library
            db.execute('SELECT * FROM users WHERE id = ?', [req.body.id]);
        ```
        - The ? tells the database: 
            - "This is data, not code. Don't execute it."

    4. The "Environment" Rule
        1. Development: Use a local Docker database.
        2. Staging    : A shared database where the team tests everything.
        3. Production : 
            - The real database 
            - (usually on AWS RDS or DigitalOcean). 
            - Never run DROP or TRUNCATE here!
