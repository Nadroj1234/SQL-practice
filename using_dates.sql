create table saved_dates(
	my_date DATE,
    my_time TIME,
    my_date_time datetime
);

select * from saved_dates;

-- just a tatse of a few built in mysql funstions
insert into saved_dates value (current_date(),  current_time(), now());

insert into saved_dates values (current_date() - interval 1 day, current_time() - interval 1 hour, now());