/* Primary Keys */
-- 2 Big Rules
-- 1. Every value is unique in the column
-- 2. No value is null

drop table if exists transactions;
create table transactions (
	transaction_id int primary key,
    amount decimal(5,2)
);

insert into transactions (transaction_id, amount) values (101, 5.67);

-- null values not supported for pk
insert into transactions (transaction_id, amount) values (null, 5.67);

/* Auto Increment! */
drop table transactions;
create table transactions (
	transaction_id int primary key auto_increment,
    amount decimal(5,2)
);
-- with auto increment, we can ignore the id for standard inserts
insert into transactions (amount) values (5.99);
select * from transactions;

-- set auto increment to start at 1000
alter table transactions auto_increment = 1000;

/* Foreign Keys */
-- what are foreign keys? 
-- They create a link between tables
-- They help to prevent storing invalid or redundant data
drop table if exists customers;
create table customers(
	customer_id int primary key,
    first_name varchar(50),
    last_name varchar(50)
);

insert into customers values 
(1, "thomas", "carpenter"),
(2, "coby", "hughes"),
(3, "jordan", "klemm"),
(4, "dakota", "kuhn");

drop table if exists transactions;
create table transactions(
	transaction_id int primary key,
    amount decimal(5,2),
    customer_id int,
    -- Important Bit
    foreign key (customer_id) references customers(customer_id) -- referencs a column in another table table(column)
);

insert into transactions values (1, 5.67, 3), (2, 3.59, 4);

select * from transactions;

-- try to insert a value for a fk that doesn't exist
insert into transactions values (3, 87.00, 99);
 -- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`cmp_joklemm`.`transactions`, CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`))	0.000 sec
