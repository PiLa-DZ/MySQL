The_Prisma_Devolopment_Loop
Summary:
    - Step 1: Modify the Schema
    - Step 2: Run the Migration
    - Step 3: Use it in your Code


More Details:

- 🔄 The Prisma Development Loop

    - Step 1: Modify the Schema
        Open your schema.prisma and make your changes.
        Example: Add bio String? to your User model.

    - Step 2: Run the Migration
        - Run the construction command again:
        ```Bash
        npx prisma migrate dev --name add_bio
        ```
        - What happens now? * Prisma generates a new SQL file in your migrations folder.
            - It updates your MariaDB table to include the bio column.
            - It automatically triggers prisma generate.

    - Step 3: Use it in your Code
        - Open your index.js (or your controller files). Because the generator ran, your VS Code will now show bio as an option when you type prisma.user.create(...).
