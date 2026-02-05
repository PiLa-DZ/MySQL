Prisma_init
Summary:
What `npx prisma init` do
1. Create prisma/
2. Create prisma/schema.prisma
3. Create .env
4. Create .gitignore
5. add `.env` to your .gitignore

More Details:
What exactly does npx prisma init do
1. Create prisma/
2. Create prisma/schema.prisma
    - What is schema.prisma --> it tells Prisma:
        1. What database you are using (MySQL, MariaDB, etc.).
        2. Where to find the database (the URL).
        3. What your tables should look like (Models).
3. Create .env
4. Create .gitignore
5. add `.env` to your .gitignore

- After running the command, your project structure will look like this:
.
├── prisma/
│   └── schema.prisma  <-- Your "Blueprint"
├── .env               <-- Your "Secret Vault"
