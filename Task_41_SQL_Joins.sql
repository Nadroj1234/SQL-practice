select nameFirst, nameLast from people p
inner join halloffame h on p.playerID = h.playerID 
where h.yearid = 2017 and h.inducted = 'Y';

---------------------------------------------------------

select nameFirst, nameLast from people p 
inner join fielding f on p.playerID = f.playerID
where f.POS = '1B' and f.teamID = 'PIT' and f.yearID = 2012;

---------------------------------------------------------

select b.*, a.gameID, a.startingPos from allstarfull a
left join batting b on a.playerID = b.playerID
where b.yearID = 2015 and b.teamID = 'PIT' and b.G >= 100;

---------------------------------------------------------

select a.gameID, a.GP, p.* from allstarfull a
right join pitching p on a.playerID = p.playerID
where p.teamID = 'PIT' and p.yearID = 2015 and p.W >= 7;

---------------------------------------------------------

select c.schoolID, p.playerID from collegeplaying c
left join pitching p on c.playerID = p.playerID
where p.teamID = 'BOS' and p.yearID = 2018 and p.playerID like '%01';

---------------------------------------------------------

select p.playerID, p.nameFirst, p.nameLast, b.yearID, m.yearID from people p
join batting b on p.playerID = b.playerID
join managers m on b.playerID= m.playerID
where b.yearID >= 2010 and m.yearID >= 2010