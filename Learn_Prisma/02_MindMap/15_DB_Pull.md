DB_Pull
Summary:
1. db push    : Schema ➡️ DB (The Force Sync - No History)
⚠️ doesn't keep a history
```Bash
npx prisma db push
```


More Details:
1. What does it do?
npx prisma db push looks at your schema.prisma file and immediately forces the database to match it.
The key difference: It does NOT create a migration folder or a SQL file. It just updates the database structure directly.

2. When do you use it?
There are three main scenarios where db push is better than migrate:
Prototyping / Messy Phase: When you are just playing around with your models and changing them every 5 minutes. You don't want to create 50 "dummy" migration files; you just want the DB to update so you can keep coding.
Local Development with "Disposable" DBs: If you are using a local database that you don't care about keeping a history for.
Prototyping with MongoDB: Since MongoDB is "schemaless," Prisma uses db push instead of migrate to ensure your indexes are set up.

3. 
```SQL
/*
|================================================================================================|
| migrate dev vs. db push (The Showdown)                                                         |
|================================================================================================|
|                              |                                  |                              |
| Feature                      | npx prisma migrate dev           | npx prisma db push           |
|______________________________|__________________________________|______________________________|
| Generates SQL Files?         | ✅ Yes (History)                 | ❌ No                        |
| Best For...                  | Production & Real Teams          | Quick Prototyping            |
| Automatically Runs Generate? | ✅ Yes                           | ✅ Yes                       |
| Keeps History?               | ✅ Yes (You can go back in time) | ❌ No (It's a one-way force) |
|================================================================================================|
*/
```

4. ⚠️ The Danger Zone
Because db push doesn't keep a history, it is very dangerous for production.
If you change a field from a String to an Int and run db push, it might just delete your data to make the change happen without warning you with a migration file first.
Rule of thumb: Use db push while you're brainstorming. Use migrate dev once you're ready to commit your work to Git.

5. 🛠️ Summary of your Prisma "Toolbox"
    1. db pull    : DB     ➡️ Schema (The Detective)
    1. db push    : Schema ➡️ DB (The Force Sync - No History)
    1. migrate dev: Schema ➡️ DB (The Architect - With History)
    1. generate   : Schema ➡️ JS Code (The Tool Builder)
