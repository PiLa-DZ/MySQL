Prisma_Client
Summary: The Translator

```BASH
npm install @prisma/client@6
```

More Details:
npm install @prisma/client@6 (the translator)
This is the Engine that your actual JavaScript code uses.
it is a library: you import it into your index.js or controllers.
its job: it translates your javascript commands (like prisma.user.findmany()) into sql queries that mariadb understands.
The "Magic" part: When you run npx prisma generate, the Prisma CLI looks at your schema.prisma and "custom-writes" this client specifically for your data. If you have a Student table, your client gets a .student method.
Analogy: This is the steering wheel and pedals of your car.
