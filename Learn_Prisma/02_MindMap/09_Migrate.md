Migrate
Summary:
1. compares  --> your files
2. generates --> "Migration File" prisma/migrations/.../migration.sql --> "Real SQL"
3. Push      --> Database
4. Run       --> `npx prisma generate` --> Update Prisma Client

More Details:
When you run 
```BASH
npx prisma migrate dev --name init
```
- 4 major things happen in one click:

1. It compares your files
Prisma looks at your schema.prisma (what you want) 
    and compares it to your current database (what you have). 
    If you added a new model like Book, 
    it realizes the database is missing a table.

2. It generates a "Migration File"
    - Prisma writes a real SQL file for you. 
        If you look in your project after running this, 
        you will see a new folder: 
        prisma/migrations/20260206..._init/migration.sql
    - Inside that file, you'll see the raw SQL: 
        CREATE TABLE Book (...). 
        This is your history. 
        If you ever break your database, 
        you can use these files to rebuild it exactly as it was.

3. It "Pushes" the change to the DB
    It executes that SQL code. 
    It creates the tables, the columns, and the relationships in MariaDB/MySQL.

4. It runs npx prisma generate
    After the database is updated, 
    Prisma automatically updates your Prisma Client (the @prisma/client we talked about). 
    This ensures that when you go back to your JavaScript code, 
    you can immediately type prisma.book.create() and it will work.

- 🧩 Breaking down the command words:
    1. npx prisma: Runs the Prisma tool.
    2. migrate dev: Tells Prisma we are in "Development Mode." This means it's okay to reset the database if things get messy, and it should keep track of our changes.
    3. --name init: This gives your change a "nickname." Your first migration is usually called init. If you add a "Price" column later, you might name the next one --name add_price.

- 🚦 When do you run this?
- You run this every single time you change a model in your schema.prisma file.
    1. Change the schema.
    2. Run migrate dev.
    3. Your database and your code are now in sync!
