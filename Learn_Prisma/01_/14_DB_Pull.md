DB_Pull
Summary:
Database(Tables) to Schema(Models)
⚠️ Prisma will overwrite your models
```SQL
|=====================================================================================|
| 🧠 Comparing the "Big Three" Commands                                               |
|=====================================================================================|
| Command     | Direction            | Best For...                                    |
|_____________|______________________|________________________________________________|
| migrate dev | Schema   ➡️ Database | Creating new tables from your code.            |
| db pull     | Database ➡️ Schema   | Importing an existing database into your code. |
| generate    | Schema   ➡️ Code     | Updating your JS tools to match your models.   |
|=====================================================================================|
```

More Details:
1. What does it do?
npx prisma db pull connects to an existing database (one that already has tables and data) and automatically writes the model definitions in your schema.prisma file for you.
Scenario: Imagine you are hired by a company that already has a massive MariaDB database with 50 tables. You don't want to spend 3 days manually typing out 50 model blocks.
The Solution: You run db pull. Prisma looks at the database and says, "Okay, I see a 'products' table with an 'id' and a 'price' column. I'll write that model for you right now."

2. The Workflow (Step-by-Step)
    1. Empty Schema: You start with an almost empty schema.prisma (just the datasource and generator).
    2. The Command: You run npx prisma db pull.
    3. The Result: Your schema.prisma is suddenly filled with all the models, fields, and relationships that exist in that database.
    4. The Final Touch: You then run npx prisma generate so your JavaScript code can start talking to that database immediately.

3. When do you use it?
    - You use this in "Introspection" mode. There are two main reasons:
    - Legacy Projects: You are adding Prisma to an old project that already has a database.
    - Database-First Design: Some developers prefer to design their tables using a visual tool (like MySQL Workbench or DBeaver) and then use Prisma to "pull" that design into their code.

4. ⚠️ One Important Warning
    - If you have models written in your schema.prisma and you run db pull, Prisma will overwrite your models with what it finds in the database. It is very powerful, so use it carefully!
