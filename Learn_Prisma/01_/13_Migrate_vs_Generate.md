Migrate_vs_Generate
Summary:
1. migrate  --> (Database Side) --> (Schema (Datasource, Model))
2. generate --> (Code Side)     --> (Schema (Generator, Model))
```SQL
|===========================================================================|
| The Key Differences                                                       |
|===========================================================================|
| Feature | prisma migrate dev         | prisma generate                    |
|_________|____________________________|____________________________________|
| Target  | The Database (MariaDB)     | The Code (node_modules)            |
| Creates | SQL files & Tables         | JavaScript/TypeScript Code         |
| Purpose | To change the DB structure | To update your coding tools        |
| Safe?   | ⚠️ Can delete data         | ✅ Always safe (only changes code) |
|===========================================================================|
```

More Details:
1. npx prisma migrate dev (Database Side)
    - This command is all about the Database Server (MariaDB/MySQL).
    1. What it does: It looks at your schema.prisma, creates a SQL file, and physically creates/changes the tables in your database.
    1. Result      : Your database now has new tables or columns.
    1. When to use : Use this whenever you change the structure of your database (adding a table, changing a column name, etc.).

2. npx prisma generate (Code Side)
    - This command is all about your JavaScript/Node.js Code.
    1. What it does: It looks at your schema.prisma and creates/updates the node_modules/@prisma/client folder.
    2. Result: It gives you "IntelliSense" (autocomplete) in VS Code. It makes sure that when you type prisma.book.findMany(), your code knows that .book exists.
    3. When to use: Prisma usually runs this for you after a migration. However, you run it manually if you just downloaded a project from GitHub or if you changed the generator block in your schema.


