1. What is a Migration?
    - A Migration is a version control system for your database schema. 
        - Just like Git tracks changes in your code, 
        - Migrations track changes in your database structure.
2. The Core Workflow
    - Instead of sharing a .sql dump file with your team, 
    - you share Migration Scripts.
        1. Developer A creates a migration file: 2026_02_01_create_users_table.js.
        2. Developer A pushes to Git.
        3. Developer B pulls the code and runs migrate up.
        4. The database is automatically updated on Developer B's machine.
3. Anatomoy of a Migration File
    - Every migration typically has two parts:
        1. UP: The code to apply the change (e.g., CREATE TABLE).
        2. DOWN: The code to reverse the change (e.g., DROP TABLE). This allows for "Rollbacks" if something goes wrong.
    ``` JavaScript
        // Example in Node.js (Knex/Sequelize style)
        exports.up = function(knex) {
          return knex.schema.createTable('products', table => {
            table.increments('id');
            table.string('name');
          });
        };

        exports.down = function(knex) {
          return knex.schema.dropTable('products');
        };
    ```
4. How the Database tracks Migrations
    - The database doesn't "know" which files have been run automatically. 
    - The Migration Tool creates a special table 
    - (usually called migrations or schema_migrations) inside your database.
    - +-------------------------------------------------------+
    - | id | migration_name              | batch,executed_at  |
    - +-------------------------------------------------------+
    - | 1  | 2026_01_01_init_db,1        | 2026-02-01 10:00   |
    - | 2  | 2026_02_01_add_bio_to_users | 2,2026-02-01 12:00 |
    - +-------------------------------------------------------+
    - When you run the migration command:
        1. The tool looks at your migrations/ folder.
        2. It checks the migrations table in the DB.
        3. It only executes the files that don't exist in the table yet.
5. Why Backend Devs Love Migrations
    - No "It works on my machine": Everyone has the exact same schema.
    - Deployment Safety          : When you deploy to a server (Production), the server runs the migrations automatically.
    - Time Travel                : You can "Rollback" your database to exactly how it looked a month ago.
    - Seeding                    : Usually paired with Seeders—scripts that populate the database with "fake" data for testing.
6. Popular Migration Tools by Language
    - Node  : Sequelize, Knex, Prisma, TypeORM.
    - PHP   : Laravel Migrations, Doctrine (Symfony).
    - Python: Alembic (SQLAlchemy), Django Migrations.
    - Go    : Migrate, Goose.
