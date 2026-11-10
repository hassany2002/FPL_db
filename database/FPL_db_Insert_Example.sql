use FPL_db

insert into users (username ,password ,teamname ,country ,Dateofbirth, Gender ,emailaddress )
values ('mo','24658hd','moo','egypt', '1990-05-16' ,'male','mo.s@yahoo.com')


insert into Leagues_cups(Leaguename,Leaguetype)
values ('leg2' ,'privite')

insert into Players(PlayerName ,TeamName ,Country ,Position ,Price )
values ('mad' ,'arsenal' ,null, 'for' ,6)

insert into GameWeek(GameweekID,Deadlinedate)
values (2,'2026-08-24' )


insert into PlayerPerformance
values ((select PlayerID from Players where PlayerName = 'raya' ),1,90,1,1,1,15)


insert into UsersLeagues
values ((select UserID from users where username = 'yy' ),
(select LeagueID from Leagues_cups where Leaguename = 'leg1' ))

insert into UsersTeams
values ('572ede68-f288-4d3b-8c01-49c272a739e9','9e97e239-d591-43cf-abba-99414f39786f',1)


insert into UserGameWeekHistory
values ('572ede68-f288-4d3b-8c01-49c272a739e9',1,50,160,100,10000)


insert into Transferss
values ((select UserID from users where username = 'ali' ),
(select PlayerID from Players where PlayerName = 'raya' )
,'2026-9-19','in',2)




