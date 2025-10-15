-- DBMS - Database Management System (eg. MySQL server)

-- Create a database:
create database cmp_joklemm;
-- tell mysql the default db.
use cmp_joklemm;

-- deleting (dropping) a database:
-- drop database cmp_jaklins2526_pm;

-- altering a database to make it read only
alter database cmp_joklemm read only = 1;
-- drop database cmp_jaklins2526_pm;
alter database cmp_joklemm read only = 0;