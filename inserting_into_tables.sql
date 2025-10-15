use cmp_joklemm;

-- inserting into a table

-- default approach (when you have all data)
insert into employees values (1, "james", "clark", 8.00, "2025-06-07") on duplicate key update employee_id = employee_id;

select * from employees;

insert into employees values
(2, "dakota", "kuhn", 67.67, "2025-06-08"),
(3, "noah", "prest", 5.67, "2025-06-09"),
(4, "thomas", "carpenter", 23, "2025-06-10") on duplicate key update employee_id = employee_id;

select * from employees;

-- what happens if we dont have all the data
-- insert into employees values (5,"jordan", "klemm", Null, Null) -- Error: Column doesnt math value count

-- inserting only some columns
insert into employees (employee_id, first_name, last_name) values (5, "jordan", "klemm") on duplicate key update employee_id = employee_id;

-- inserting in a different order
insert into employees (last_name, first_name, employee_id, hourly_pay) values ("stempka", "william", 6, 41.67) on duplicate key update employee_id = employee_id;

select * from employees;

update employees set hourly_pay = .42 where employee_id = 4;

update employees set hourly_pay = .37 where first_name = "dakota";

update employees set hourly_pay = hourly_pay * .1 where employee_id !=0;

select * from employees
