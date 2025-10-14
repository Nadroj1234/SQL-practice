-- DBMS - Database Management System (eg. MySQL

-- Create a database:
create database cmp_joklemm;

use cmp_joklemm;

-- deleting (dropping) a database:
-- drop database cmp_joklemm;

-- alternating a database to make it read only
alter database cmp_joklemm read only = 1;
-- drop database cmp_joklemm;
alter database cmp_joklemm read only = 0;

