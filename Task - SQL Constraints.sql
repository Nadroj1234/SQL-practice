-- ============================================================
-- SQL Constraint Practice — Student Worksheet
-- Instructions:
-- • Read each prompt carefully and write your SQL beneath it.
-- • Use correct data types and constraint syntax, but write all the SQL yourself.
-- • If you hit an error, leave the query and explain why it failed using a comment.
-- ============================================================

use cmp_joklemm;

/* ============================================================
   Part A — PRIMARY KEY & AUTO_INCREMENT
   Concepts: PRIMARY KEY, AUTO_INCREMENT, ALTER TABLE ... AUTO_INCREMENT
   ============================================================ */

-- A1) Create a table named students with:
--     • A column for a student ID that should be an integer, act as the primary key, and auto-increment.
--     • Columns for first name and last name that cannot be null.
--     • A column for email that can be left empty for now.
--   Then insert at least three students without providing their ID numbers.
--   Finally, SELECT all rows to verify IDs are automatically assigned.
create table students(
	studnt_id int primary key auto_increment,
    first_name varchar(50) not null,
	last_name varchar(50) not null,
    email varchar(50)
);

insert into students (first_name, last_name) values
("dakota", "kuhn"),
("jordan", "klemm"),
("james", "clark");


select * from students;


-- A2) Modify the students table so that new IDs start at 500.
--     Insert one more student and confirm the new student ID starts from that number.
alter table students auto_increment = 500;

insert into students (first_name, last_name) values
("coby", "hughes");

insert into students (first_name, last_name) values
("prest", "noah");


/* ============================================================
   Part B — UNIQUE
   Concepts: UNIQUE on single column, composite UNIQUE across two columns
   ============================================================ */

-- B1) Add a constraint to the students table so that no two students can have the same email address.
--     Assign each existing student a unique email address.
--     Attempt to insert a new student with a duplicate email to see what error occurs.

drop table if exists students;

create table students(
	studnt_id int primary key auto_increment,
    first_name varchar(50) not null,
	last_name varchar(50) not null,
    email varchar(50) unique
);

insert into students (first_name, last_name, email) values
("dakota", "kuhn", "ilovelebron@gmail.com"),
("jordan", "klemm", "joklemm@gmail.com"),
("james", "clark", "ilovepokemon@gmail.com");

/* insert into students (first_name, last_name, email) values
("james", "clark", "ilovepokemon@gmail.com"); */


select * from students;


-- B2) Create a table named lockers with:
--     • A column for locker ID that should be an integer, act as the primary key, and auto-increment.
--     • A column for the hallway name (text, required).
--     • A column for the locker number (integer, required).
--   Add a rule so that the combination of hallway and locker number must be unique.
--   Insert two valid lockers, then attempt to insert one that duplicates both hall name and locker number.

drop table if exists lockers;


create table lockers(
	locker_id int primary key auto_increment,
    hallway_name varchar(50) not null,
    locker_number int not null,
    unique (hallway_name, locker_number)
);

insert into lockers (hallway_name, locker_number) values
("red", 67),
("green", 41);

-- insert into lockers (hallway_name, locker_number) values ("red", "67");

select * from lockers;

/* ============================================================
   Part C — NOT NULL
   Concepts: ALTER COLUMN to NOT NULL, NOT NULL insert failure
   ============================================================ */

-- C1) Update the students table so the email column must always contain a value (cannot be NULL).
--     Test by inserting a student record without an email and observe what happens.

drop table if exists students;

create table students(
	studnt_id int primary key auto_increment,
    first_name varchar(50) not null,
	last_name varchar(50) not null,
    email varchar(50) unique not null
);

insert into students (first_name, last_name, email) values ("james", "clark", null);

-- C2) Create a table named courses with:
--     • A column for a course code (short text) that serves as the primary key.
--     • A title (text) that must always have a value.
--     • A credit amount (integer) that must always have a value.
--   Insert one valid record, then test inserting another that leaves a required column blank to trigger an error.

drop table if exists courses;

create table courses (
	course_code varchar(10) primary key,
    title text not null,
    credit_amount int not null
);

insert into courses (course_code, title, credit_amount) values ("sixseven", "math", 67);


insert into courses (course_code, title, credit_amount) values (1362, null, 67);


select * from courses;

/* ============================================================
   Part D — CHECK
   Concepts: CHECK with range; CHECK with IN-list
   ============================================================ */

-- D1) Add a CHECK constraint to the courses table so that credits must be within a sensible range (for example, between 1 and 6).
--     Try inserting one course that violates the rule and one that meets it.

drop table if exists courses;

create table courses (
	course_code varchar(10) primary key,
    title text not null,
    credit_amount int not null,
	constraint chk_credit CHECK (credit >= 1 and credit <= 6)
);

-- D2) Create a table named devices with:
--     • A column for asset_tag that should be a unique identifier and act as the primary key.
--     • A column for device_type that must always contain a value.
--     • A column for status that defaults to “in_stock”.
--   Add a rule that only allows specific device types (for example, laptop, tablet, router).
--   Insert one valid record for each allowed type, then insert one with an invalid type to see the constraint in action.



/* ============================================================
   Part E — DEFAULT
   Concepts: DEFAULT on string, DEFAULT on timestamp
   ============================================================ */

-- E1) Add a new record to the devices table, leaving out the status column.
--     Verify that the status automatically fills in with the default value.



-- E2) Create a table named tickets with:
--     • A column for ticket_id that should be an integer, act as the primary key, and auto-increment.
--     • A column for subject (short text) that must always have a value.
--     • A column for opened_at that automatically fills with the current date and time.
--     • A column for priority that defaults to a typical value like “normal”.
--   Insert at least two tickets without specifying all columns and confirm the defaults are applied.



/* ============================================================
   Part F — FOREIGN KEY
   Concepts: FOREIGN KEY relationships, referential integrity
   ============================================================ */

-- F1) Create a table named checkouts with:
--     • A column for checkout_id that should be an integer, act as the primary key, and auto-increment.
--     • A column for asset_tag that connects to the devices table.
--     • A column for student_id that connects to the students table.
--     • A column for due_date (date).
--   Add foreign key constraints linking asset_tag and student_id to their respective parent tables.
--   Insert one valid record and one that references a non-existent asset_tag to test the foreign key protection.



-- F2) Try deleting a student who is still listed in the checkouts table.
--     Note what error appears and explain why.
--     Then delete the related checkout record and delete the student successfully.



/* ============================================================
   Part G — Mixed Practice Mini-Scenarios
   Concepts: Combining PRIMARY KEY, UNIQUE, CHECK, DEFAULT, and FOREIGN KEY
   ============================================================ */

-- G1) Create a table named clubs with:
--     • A club_id column that should be an integer, act as the primary key, and auto-increment.
--     • A club_name column that must always have a value and must be unique.
--     • A column for advisor_email (text) that must always have a value.
--     • A column for budget that defaults to 0.00 and cannot be negative.
--   Insert two valid clubs.
--   Then attempt one with a duplicate name and one with a negative budget, and note what happens.



-- G2) Create a table named memberships with:
--     • A column for membership_id that should be an integer, act as the primary key, and auto-increment.
--     • A column for student_id that connects to the students table.
--     • A column for club_id that connects to the clubs table.
--   Add a rule that prevents the same student from joining the same club more than once.
--   Insert one valid membership, then try inserting the same student/club pair again to test the rule.



