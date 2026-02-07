Migrate_status

2. Can I see the history?
    - Yes! You can see your "Timeline of Changes" in two ways:
    1. Way 1: The Terminal (The Quick View)
        - Run this command:
        ```Bash
        npx prisma migrate status
        ```
        - This will tell you if your database is up to date and show you the status of your migration history.

    2. Way 2: The Database (The Detailed View)
        - If you open your MariaDB client (like HeidiSQL, DBeaver, or even the terminal) and run:
        ```SQL
        SELECT * FROM _prisma_migrations;
        ```
        - You will see a list of every migration you have ever run, in order.
