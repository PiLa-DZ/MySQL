- DCL (Data Control Language).
    - This is how you manage who can actually run those queries in a real-world production environment.

- Summary for your Security/DCL Folder
    1. User ID   : Always consist of 'user'@'host'.
    2. Privileges: SELECT, INSERT, UPDATE, DELETE, CREATE, DROP.
    3. Apply     : GRANT  ... TO   ...
    4. Remove    : REVOKE ... FROM ...
    5. Refresh   : FLUSH PRIVILEGES;

- ⚠️ Security Pro-Tip
    - As a backend developer, 
    - when you connect your Node.js, Python, or PHP app to the database, 
    - your .env file should use a user created with the "Principle of Least Privilege." 
    - If your app doesn't need to DROP tables, 
    - don't give that user the permission to do so. 
    - This way, if your app is hacked, 
    - the hacker can't delete your entire database.
