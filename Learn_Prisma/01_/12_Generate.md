
Summary:
1. Scans Models: --> (Schema (Model))
2. Writes Code : --> node_modules/.prisma/client folder.
3. Functions   : --> prisma.book.create().

More Details:
- 🛠️ What actually happens?
    - When you run npx prisma generate, Prisma does three things:
    1. Scans your Models: It looks at every table you defined (like Student, Course, or Book).
    2. Writes Code: It literally writes thousands of lines of JavaScript and TypeScript code inside your node_modules/.prisma/client folder.
    3. Customizes Functions: It creates specific functions for your models. If you have a Book model, it creates prisma.book.create(). If you delete that model and run the command again, that function disappears from your code tools.



