Datasource
Summary:
1. provider = (The Language)
2. url      = (The Location)
NOTE: You can only have ONE datasource

More Details:
```PRISMA
datasource db {
  provider = "mysql"
  url      = env("DATABASE_URL")
}
```
1. provider = "mysql" (The Language)
This tells Prisma which database engine you are using. Different databases have slightly different rules (SQL "dialects").
For MariaDB or MySQL, we use "mysql".
If you were using PostgreSQL, you would change this to "postgresql".
NOTE: Why this matters, When you run a migration, Prisma looks at the provider. If it's mysql, it writes the SQL query using AUTO_INCREMENT. If it's postgresql, it uses SERIAL. It handles the annoying differences so you don't have to.

2. url = env("DATABASE_URL") (The Location)
This is the "Connection String." It tells Prisma exactly where to find your database. Instead of writing the password directly here (which is dangerous!), we use env() to tell Prisma: "Go look in the .env file for a variable named DATABASE_URL."
A typical URL looks like this: mysql://root:password123@localhost:3306/my_database

🚦 The "Guardrail" Rule
NOTE: You can only have ONE datasource block in your schema file. Prisma is designed to talk to one main database per project to keep things simple and fast.
