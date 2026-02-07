touch README.md
touch index.js
touch .gitignore
touch .env

echo "/node_modules" >> .gitignore
echo "/.env" >> .gitignore

npm init -y
npm pkg set type="module"
npm pkg set scripts.start="node index.js"
npm pkg set scripts.dev="nodemon index.js"

npm install express --verbose
npm install dotenv --verbose
npm install nodemon --save-dev --verbose

git init

npm install prisma@6 --save-dev
npm install @prisma/client@6 --save-dev
npx prisma init

echo '
datasource db {
  provider = "mysql"
  url      = env("DATABASE_URL")
}

generator client {
  provider = "prisma-client-js"
}

model User {
  id    Int     @id @default(autoincrement())
  email String  @unique
  name  String?
  posts Post[]
}

model Post {
  id        Int      @id @default(autoincrement())
  title     String
  content   String?
  published Boolean  @default(false)
  author    User     @relation(fields: [authorId], references: [id])
  authorId  Int
}
' > prisma/schema.prisma

echo '
DATABASE_URL="mysql://admin:your_password@localhost:3306/db1"
' > .env

# NOTE: You have to drop database if exists
#$ mysql -u admin -p
#$ drop database if exists db1

npx prisma migrate dev --name init

echo "
import { PrismaClient } from '@prisma/client';
const prisma = new PrismaClient();

async function main() {
  // Create a new user and a post at the same time!
  const newUser = await prisma.user.create({
    data: {
      name: 'Nabil',
      email: 'nabil@example.com',
      posts: {
        create: { title: 'Learning Prisma is Awesome!' },
      },
    },
  });
  console.log('Created User:', newUser);
}

main()
  .catch((e) => console.error(e))
  .finally(async () => await prisma.\$disconnect());
" > index.js

npm start
