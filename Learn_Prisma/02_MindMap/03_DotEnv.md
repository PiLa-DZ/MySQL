DotEnv
Summary: reads the .env file and loads those variables into process.env

```BASH
npm install dotenv
```

More Details:
npm install dotenv (The Security Guard)
This has nothing to do with Prisma specifically, but it's essential for modern apps.
Its job: It reads the .env file and loads those variables into process.env.
Why we use it: You should never hardcode your database password inside your schema.prisma or your JavaScript files. If you push your code to GitHub, everyone would see your password.
Analogy: It’s a safe where you keep your keys. Your code knows how to ask the safe for the key, but the key isn't written on the wall.
