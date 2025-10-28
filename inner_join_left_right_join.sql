/* Single inner join */
select * from games g 
inner join screenshots s on g.game_id = s.game_id
where g.game_id = 13104;

select * from games g
left join websites w on w.game_id = g.game_id
where g.name like '%Final Fantasy%';


select g.name title, g.summary, w.url website from websites w
right join games g on g.game_id = w.game_id
where g.name like '%Final Fantasy%';