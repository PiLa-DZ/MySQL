-- == Rename Database (First Way) ==========================
CREATE DATABASE new_db_name;
$ mysqldump -u admin -p old_db_name | mysql -u admin -p new_db_name
DROP DATABASE old_db_name;

-- == Rename Database (Second Way) =========================
CREATE DATABASE new_db_name;
RENAME TABLE old_db_name.employees TO new_db_name.employees;
RENAME TABLE old_db_name.departments TO new_db_name.departments;
DROP DATABASE old_db_name;
