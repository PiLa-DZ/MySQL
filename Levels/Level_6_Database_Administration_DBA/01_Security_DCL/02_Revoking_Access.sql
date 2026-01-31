-- You want to restrict them to "Read Only" access

-- Take away the ability to insert and update
REVOKE INSERT, UPDATE ON facebook.* FROM 'dev_user'@'localhost';

-- Now they can only SELECT.
FLUSH PRIVILEGES;
