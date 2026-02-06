Generator_Client_blook
Summary:
1. generator client: telling Prisma to "generate" something.
2. provider        : tells Prisma what to create.
⚠️NOTE: You have to run `npx prisma generate` after change schema


More Details:
```PRISMA
generator client {
  provider = "prisma-client-js"
}
```
generator client: This is just the name of the block. You are telling Prisma to "generate" something.
provider = "prisma-client-js": This tells Prisma what to create. In this case, it’s creating the Prisma Client, which is a library designed specifically for Node.js and TypeScript/JavaScript.

🧪 Why is this so cool? (The "Secret Sauce")
In the old way (Raw SQL), you used a generic library like mysql2. That library didn't know your database; it just sent strings.
With the Generator, every time you run npx prisma generate:
1. Prisma reads your schema.prisma models (like User or Course).
2. It literally rewrites code inside your node_modules/@prisma/client folder.
3. It creates a "smart" object that knows your table names and column names.

💡 The Result in your Code
Because of this generator, when you start typing in your index.js, your editor (VS Code) becomes your best friend.
If you have a model named Student, the generator creates a function specifically named prisma.student.findMany(). You don't get "Generic Database Tool"; you get "Your Specific Database Tool."

⚠️ Common Mistake
Many beginners forget that if they change their schema.prisma (like adding a new table), they must run the generator again so the JavaScript code gets updated.
Command: npx prisma generate
