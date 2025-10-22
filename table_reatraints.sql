use cmp_joklemm;
/* Constraints/Topics to talk about:
- Unique
- Not Null
- Check
- Default
- Primary Keys
- Auto Increment
- Foreign Keys
*/

-- THE UNIQUE constraint
-- makes sure that all values of a column are unique - kind of like PK
-- use it when you create/alter a table 

drop table if exists products;
create table products(
	product_id  INT,
    product_name varchar(25) UNIQUE, -- no two products may have the same name
    price decimal(4,2)
);

insert into products values
(100, 'Acid', 99.99),
(101, 'Food', 77.70),
(102, 'Cardboard', 1.00),
(103, 'Paper', .50);

select * from products;

/* Not allowed - product_name must be unique */
insert into products values
(104, 'Food', 87.00);

/* If you want to remove the unique constraint */
Alter table products
drop index product_name;

/* If you wish to add the unique constraint */
-- Note - this will fail if there are already duplicates
Alter table products
add constraint unique (product_name);

/* Next Constraint - NOT NULL */
-- null means there is no value
drop table if exists products;

create table products (
	product_id int,
    product_name varchar(25),
    price decimal(4,2) not null -- we do not want to store anything without a price
);

insert into products values
(100, 'Acid', 99.99),
(101, 'Food', 77.70),
(102, 'Cardboard', NULL),
(103, 'Paper', .50);
-- Error Code: 1048. Column 'price' cannot be null

/* the CHECK constraint */
/* Teh check constraint limits what values can be placed in a column of the table */
create table cmp_students (
	student_id int,
    first_name varchar(50),
    last_name varchar(50),
    gpa decimal(3,2),
    constraint chk_gpa CHECK (gpa >= 3.0 and gpa <= 5.0)
);

insert into cmp_students values
(1, "joseph", "warren", 3.2);

insert into cmp_students values
(2, "Mr", "Beast", 2.1);
-- Error code: 3819. Check constraint 'chk_gpa' is violated.

insert into cmp_students values
(3, "James", "Clark", 4.1);

insert into cmp_students values
(4, "Noah", "Prest", 6.7);
-- Error code: 3819. Check constraint 'chk_gpa' is violated.

select * from cmp_students;

-- remove the check restraint
alter table cmp_students
drop check chk_gpa;

-- add it back
alter table cmp_students
add constraint chk_gpa Check (gpa >= 3.0 and gpa <= 5.0);

/* the DEFAULT constraint */
drop table if exists products;
create table products (
	product_id int,
    product_name varchar(25),
    price decimal (4,2) default 99.99 -- if someone inserts a record without specifying price, 99.99
);

insert into products (product_id, product_name) 
values (100, "yo-yo");

select * from products;

alter table products
alter column price set default 0.00;

insert into products (product_id, product_name)
values(101, "water");

drop table if exists transactions;
create table transactions (
transaction_id int,
amount decimal(5,2),
transaction_date datetime default NOW());

insert into transactions (transaction_id, amount) value (1, 55.00);

select * from transactions
