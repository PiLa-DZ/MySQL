Model
Summary:
- Blueprint for a Table in your database.
1. Name       (Student)
2. Fields     (id)
3. Types      (Int)
4. Attributes (@unique)
- work in two directions:
    1. Down to the DB : npx prisma migrate dev
    2. Up to your Code: npx prisma generate

More Details:
A model is the blueprint for a Table in your database.
In your old project, you used SQL to create tables (e.g., CREATE TABLE students...). In Prisma, you never write that SQL manually. Instead, you define a model in your schema file, and Prisma translates that into a real database table for you.

🧱 Anatomy of a Model
Here is a classic example of a model:
```PRISMA
model Student {
  id         Int      @id @default(autoincrement())
  firstName  String
  email      String   @unique
  age        Int?
  createdAt  DateTime @default(now())
}
```
Every model is made of three parts:

1. The Name (Student)
This is what the table will be called in your database. Usually, we use PascalCase (Capitalized) and singular names.

2. The Fields (id, firstName, email)
These become the Columns in your table. You define the name first, then the data type.

3. The Types and Attributes
Types: Int, String, Boolean, DateTime.
Attributes (The @ symbols): These are "special instructions" for that column:
@id: This is the Primary Key.
@default(autoincrement()): Tells the database to handle the ID numbers (1, 2, 3...) automatically.
@unique: Ensures no two students can have the same email.
? (Optional): Notice age Int?. That question mark means the age is optional (it can be NULL in the database).

🔄 How Models Turn Into Code
The reason we use models is because they work in two directions:
1. Down to the DB: When you run npx prisma migrate dev, Prisma sees the model and creates the SQL table.
2. Up to your Code: Because you defined a model named Student, the Generator (which we talked about earlier) creates prisma.student in your JavaScript. You get all the methods like .create(), .findMany(), and .delete() for free!
