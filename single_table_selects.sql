use cmp_joklemm;
/* Select means: I want to get data */
/* * means all columns */
/* From employees means we are using the employees table */
select * from employees; /* select all columns - and all rows */

/* Select specific columsn */
select first_name, last_name from employees;

/* change the order */
select last_name, first_name from employees;

/* chnage how the columns are shown */
select first_name student_first_name, last_name student_last_name from employees;

/* filter results */
/* use the WHERE clause */
select first_name, last_name, employee_id from employees where employee_id = 1;

/* find someone by first name */
select * from employees where first_name = "Noah";

select * from employees where hourly_pay > 1; -- comparisons: > < >= <= <> !=

/* find evryone hired before june 2025 */
select * from employees where hire_date <= "2025-06-09";

/*  use not equals */
select * from employees where last_name <> "Klins";
select * from employees where last_name != "Klins";

/* dealing with nulls */
select * from employees where hire_date is NULL;
select * from employees where hire_date is not NULL;

/* multiple conditions */
select * from employees where hourly_pay > 1 and hire_date is NULL;

select * from employees where hire_date is null or hire_date > "2025-10-01";

/* wildcards in text */
/* find all employees whos first name starts with J */
select * from employees where first_name LIKE "j%"; -- notice the "LIKE" and the "%" (zero or many chars)

/* find all employees whose name end in k */
select * from employees where last_name LIKE "%k";

/* find all employees whose last_name starts with c and contains an "e" */
select * from employees where last_name LIKE "c%e%";  

-- couple more notes on LIKE
-- single character check
-- find all emplyees whose name starts with any letter and then has "lins"
select * from employees where last_name LIKE "_lins";  
