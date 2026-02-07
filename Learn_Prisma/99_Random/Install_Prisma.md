```Bash
npm install @prisma/client
npm install prisma --save-dev
npx prisma init

# For Your WorkFlow
npm i --save-dev @types/node

# To pull your database
npx prisma db pull

# What this does: 
# It looks at your schema.prisma and creates a custom PrismaClient in your node_modules. 
# This is what gives you that beautiful auto-completion (IntelliSense) for your specific tables.
npx prisma generate
```

```Bash
# Step 1: Install the Stable Version 📦

# Uninstall the version 7 stuff first to be safe
npm uninstall prisma @prisma/client

# Install the stable version 6
npm install prisma@6 @prisma/client@6 --save-dev
npm install @prisma/client@6
npm install dotenv

# Step 2: Initialize Prisma 🏗️
npx prisma init

# Step 3: Your .env file: Keep it simple. No complex strings.
DATABASE_URL="mysql://admin:your_password@localhost:3306/Students_Courses_DB"

# Step 4: Your prisma/schema.prisma: In version 6, we keep the url right in the schema. It's much easier to manage.
datasource db {
  provider = "mysql"
  url      = env("DATABASE_URL")
}

generator client {
  provider = "prisma-client-js"
}

# Step 5: The "Pull" 🧲
npx prisma db pull

# Step 6:
npx prisma generate

# Step 7: Create prisma.js
import { PrismaClient } from '@prisma/client';
const prisma = new PrismaClient();
export default prisma;
```
