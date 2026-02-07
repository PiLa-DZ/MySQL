Prisma_Schema_Language (PSL).
Summary:
```Prisma
// Modul | Name | Curly Braces
   model   User   { 
        // Field...
        // Field...
        // Name | Type  | Attributes
        userId    Int     @id @default(autoincrement())
        //          Optional
        name  String?
        //          List --> []
        tags String[]
       }
```
1. Model
2. Model Name
3. Model Curly Braces {}
4. Field
5. Field Name           --> (id, name, userName)
6. Field Type           --> (Int, String, Boolean)
7. Field Type Modifiers --> (? and [])
8. Field Attributes     --> @ 
9. Block Attributes     --> @@

More Details:
- Step 1: The Basic Anatomy
    - A model always starts with the keyword model, followed by the name (PascalCase), and curly braces.
    ```Prisma
    // Modul | Name | Curly Braces
       model   User   { }
    ```

- Step 2: Defining Fields
    - Every line inside the braces is a Field. Each field needs three things:
    ```Prisma
    model User {
        // Field...
        // Field...
    }
    ```
    1. Name (camelCase)
    2. Type (Int, String, Boolean, DateTime)
    3. Attributes (Optional modifiers like @id or @unique)
    4. Field Attributes (@)
    ```Prisma
    model User {
        // Name | Type  | Attributes
        userId    Int     @id @default(autoincrement())
    }
    ```

- Step 3: Essential Attributes (The Rules)
    - To make your model work, you need to give the fields "rules." Here are the big four:

- Step 4: The "Required vs. Optional" Question
    - By default, every field is Required.
    - Optional: Add a ? after the type.
    - Example: bio String? (The user doesn't have to have a bio).
    ```Prisma
    model User {
        //          Optional
        name  String?
    }
    ```
- Type Modifiers (? and [])
    1. ?  (The Optional Modifier): By default, every field is Required.
    2. [] (The List Modifier):     Makes the field an array (multiple values).
    ```Prisma
    model User {
        //          Optional --> ?
        name  String?
        //          List --> []
        tags String[]
    }
    ```
- Block Attributes (@@)
    - These are special! They don't go on a single line; they go at the bottom of the model. They affect the whole table.
    1. @@id([title, author]) → A "Composite ID" (using two columns together as one ID).
    2. @@index([email]) → Helps the database search faster.
    3. @@map("users_table") → Tells Prisma: "In my code, call this model User, but in MariaDB, call the table users_table."
