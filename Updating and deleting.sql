select * from employees;
/*
so far we have:
- created a database
- created a table
- inserted into tables 
- selected from a single table
*/

-- today we'll look at updates and deletes (Task 44)
-- update one field for an employee
Update employees set hourly_pay = 999.99 where employee_id = 4;

-- update multiple fields for an employee
Update employees set last_name = "prest", hourly_pay = 999.99 where employee_id = 1;

-- set a field to null
Update employees set first_name = "LeBraune", last_name = null where employee_id = 1;

-- update all hourly pays
Update employees set hourly_pay = 55.01;

-- delete a record from our table
delete from employees where employee_id = 3;
	-- carefull dont delete everything
    
start transaction;
delete from employees;
rollback; -- if we wanted to keep it we would say commit;

-- by default, MySQL auto-commits everything.
-- lets turn that off

Set autocommit = OFF;
/* this will allow us to review our changes, before saving */

delete from employees where last_name = "Klins";
rollback;

delete from employees where last_name = "Klins";
commit;

rollback; -- does nothing immediately after a commit

Set autocommit = ON;
