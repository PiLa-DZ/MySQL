import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

async function main() {
  // Create a new user and a post at the same time!
  const newUser = await prisma.user.create({
    data: {
      name: "Nabil",
      email: "nabil@example.com",
      posts: {
        create: { title: "Learning Prisma is Awesome!" },
      },
    },
  });
  console.log("Created User:", newUser);
}

main()
  .catch((e) => console.error(e))
  .finally(async () => await prisma.$disconnect());
