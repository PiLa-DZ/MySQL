# ORMs (Object-Relational Mapping)
- Definition
    - A library that maps database tables to JavaScript objects.
- Popular Node.js Choices
    1. Prisma   : (The current industry favorite).
    2. Sequelize: (The most common in older Node.js apps).
```SQL
/*
+---------------------------------------------------------------------------+
| Comparison                                                                |
+-------------+---------------------------+---------------------------------+
| Feature     | Raw SQL                   | ORM                             |
+-------------+---------------------------+---------------------------------+
| Control     | 100% (Full Power)         | 80% (Abstracted)                |
| Safety      | Manual (Injection risk)   | Automatic (Built-in protection) |
| Speed       | Fastest                   | Slightly Slower                 |
| Maintenance | Hard (Strings everywhere) | Easy (Clean code)               |
+-------------+---------------------------+---------------------------------+
*/
```

1. The Core Concept: The "Translator"
    - Database side: Tables, Rows, and Columns (SQL).
    - Node.js side : Objects, Arrays, and Classes (JavaScript).
    1. Without an ORM, you have to write SQL as strings in your code: 
        ```JavaScript
        const getUser = db.query("SELECT * FROM users WHERE id = 1")
        ```
    2. With an ORM, you just call a method:
        ```JavaScript
        const user - await User.findById(1)
        ```

2. Why Node.js Developers love ORMs
    1. Speed of Development: You don't have to worry about syntax errors in strings.
    2. Security            : ORMs automatically prevent SQL Injection (they handle the ? parameters for you).
    3. Migrations          : Most ORMs have built-in tools to handle the 07_Migrations_Concept.md we discussed earlier.
    3. Database Agnostic   : If you want to switch from MariaDB to PostgreSQL, you usually only have to change one line of config.

3. The "Big Three" for Node.js
```SQL
/*
+-----------+--------------------------+-------------------------------------------------+
| If you are looking for a job, you will likely use one of these:                        |
+-----------+--------------------------+-------------------------------------------------+
| ORM       | Style                    | Best For...                                     |
+-----------+--------------------------+-------------------------------------------------+
| Prisma    | Modern / Type-safe       | "New projects, developers who love TypeScript." |
| Sequelize | Classic / Traditional    | "Older projects, very mature and flexible."     |
| TypeORM   | Enterprise / Class-based | "Large-scale apps, looks a lot like Java/C#."   |
+-----------+--------------------------+-------------------------------------------------+
*/
```

4. The "Trap": When ORMs are Bad
    - As a backend developer, you must know that ORMs have a "tax":
    1. Performance        : They are slightly slower than Raw SQL because they have to "translate" everything.
    2. Hidden N+1 Problems: It is very easy to accidentally create the 08_N+1_Problem using an ORM if you aren't careful.
    3. Complex Queries    : If you need a very complex report with 10 Joins, writing it in an ORM is a nightmare. In that case, we use Raw SQL.
