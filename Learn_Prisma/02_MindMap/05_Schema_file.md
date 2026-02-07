Schema_file
Summary:
The 3 Main Parts of a Schema File
1. The Datasource (The Connection)
2. The Generator  (The Tool Maker)
3. The Models     (The Blueprint)
⚠️NOTE: You have to run `npx prisma generate` after change schema

More Details:
1. The Datasource (The Connection)
This tells Prisma exactly how to talk to your database.
```PRISMA
datasource db {
  provider = "mysql"             // Which language? (MySQL/MariaDB)
  url      = env("DATABASE_URL") // Where is the database? (Stored in .env)
}
```

2. The Generator (The Tool Maker)
This tells Prisma, "When I'm done with the schema, I want you to build me a JavaScript library that I can import."
```PRISMA
generator client {
  provider = "prisma-client-js" // Create the @prisma/client library
}
```

3. The Models (The Blueprint)
This is where you define your tables. Each model becomes a table in your database.
```PRISMA
model User {
  id    Int     @id @default(autoincrement()) // Primary Key
  email String  @unique                       // Unique Constraint
  name  String?                               // Optional field
}
```
