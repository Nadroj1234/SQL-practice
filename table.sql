-- Tables!
-- Table are made up of rows and columns - kind of like spreadsheets
-- Each row is a record - contains information about a single object (eg. one employee)
-- Each column is a type of data (eg. name,date,pay)

drop table if exists employees;
create table employees (
	employee_id INT primary key,
    first_name varchar(50) /* we want this to be a string but SQL has 2 text types: char and varchar */,
    last_name varchar(50),
    hourly_pay decimal(5,2),
    -- the 5 means 5 digits and 2 mean that 2 are right to the decimal point ,
    hire_date date
    
);

-- have a look at our table
select * from employees;

-- insert a record to see what it looks like
insert into employees value (0, "Mister", "Klins", 1.18, "2025-10-14");

-- ranaming the table:
rename table employees to suckas;
rename table suckas to employees;

-- altering a table to have another column;
alter table employees add phone_number varchar(15);

-- alter table column name
alter table employees rename column phone_number to email;

-- change a column colums datatype
alter table employees modify column email varchar(100);

-- moving a columns position
alter table employees modify column email varchar(100) FIRST /*AFTER last_name*/;

-- removing a column
alter table employees drop column email;