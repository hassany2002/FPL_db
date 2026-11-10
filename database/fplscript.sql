USE [master]
GO
/****** Object:  Database [FPL_db]    Script Date: 11/11/2026 11:49:24 PM ******/
CREATE DATABASE [FPL_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FPL_db', FILENAME = N'C:\Users\Youssef\Desktop\FPL_db\FPL_db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FPL_db_log', FILENAME = N'C:\Users\Youssef\Desktop\FPL_db\FPL_db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [FPL_db] SET COMPATIBILITY_LEVEL = 170
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FPL_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FPL_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FPL_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FPL_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FPL_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FPL_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [FPL_db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FPL_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FPL_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FPL_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FPL_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FPL_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FPL_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FPL_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FPL_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FPL_db] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FPL_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FPL_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FPL_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FPL_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FPL_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FPL_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FPL_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FPL_db] SET RECOVERY FULL 
GO
ALTER DATABASE [FPL_db] SET  MULTI_USER 
GO
ALTER DATABASE [FPL_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FPL_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FPL_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FPL_db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FPL_db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FPL_db] SET OPTIMIZED_LOCKING = OFF 
GO
ALTER DATABASE [FPL_db] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FPL_db] SET QUERY_STORE = ON
GO
ALTER DATABASE [FPL_db] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [FPL_db]
GO
/****** Object:  UserDefinedFunction [dbo].[displayLeaguename]    Script Date: 11/10/2026 11:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[displayLeaguename](@id UNIQUEIDENTIFIER)
returns varchar(20) 
begin
    declare @n varchar(20)
    select @n = Leaguename from Leagues_cups where LeagueID = @id
    return @n
end
GO
/****** Object:  UserDefinedFunction [dbo].[displayplayername]    Script Date: 11/10/2026 11:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[displayplayername](@id UNIQUEIDENTIFIER)
returns varchar(20) 
begin
    declare @n varchar(20)
    select @n = PlayerName from Players where PlayerID = @id
    return @n
end
GO
/****** Object:  UserDefinedFunction [dbo].[displayteamname]    Script Date: 11/10/2026 11:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[displayteamname](@id UNIQUEIDENTIFIER)
returns varchar(20) 
begin
    declare @n varchar(20)
    select @n = teamname from users where UserID = @id
    return @n
end
GO
/****** Object:  UserDefinedFunction [dbo].[displaytransferin]    Script Date: 11/10/2026 11:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[displaytransferin](@id UNIQUEIDENTIFIER)
returns UNIQUEIDENTIFIER 
begin
    declare @n UNIQUEIDENTIFIER
    select @n = playerid from Transferss where UserID = @id and Transfertype = 'in'
    return @n
end
GO
/****** Object:  UserDefinedFunction [dbo].[displaytransferout]    Script Date: 11/10/2026 11:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[displaytransferout](@id UNIQUEIDENTIFIER)
returns UNIQUEIDENTIFIER 
begin
    declare @n UNIQUEIDENTIFIER
    select @n = playerid from Transferss where UserID = @id and Transfertype = 'out'
    return @n
end
GO
/****** Object:  UserDefinedFunction [dbo].[displayusername]    Script Date: 11/10/2026 11:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[displayusername](@id UNIQUEIDENTIFIER)
returns varchar(20) 
begin
    declare @n varchar(20)
    select @n = username from users where UserID = @id
    return @n
end
GO
/****** Object:  Table [dbo].[users]    Script Date: 11/10/2026 11:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[UserID] [uniqueidentifier] NOT NULL,
	[username] [varchar](20) NOT NULL,
	[password] [varchar](max) NOT NULL,
	[teamname] [varchar](20) NOT NULL,
	[country] [varchar](20) NULL,
	[Dateofbirth] [date] NULL,
	[Gender] [varchar](20) NULL,
	[emailaddress] [varchar](20) NULL,
	[SquadValue] [int] NULL,
	[IntheBank] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[emailaddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[displayuserinfo]    Script Date: 11/10/2026 11:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[displayuserinfo] (@id UNIQUEIDENTIFIER)
returns table
as 
return
(
    select username,teamname,country,Dateofbirth,Gender,IntheBank,SquadValue from users where UserID = @id
)
GO
/****** Object:  Table [dbo].[Players]    Script Date: 11/10/2026 11:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Players](
	[PlayerID] [uniqueidentifier] NOT NULL,
	[PlayerName] [varchar](20) NOT NULL,
	[TeamName] [varchar](20) NOT NULL,
	[Country] [varchar](20) NULL,
	[Position] [varchar](20) NULL,
	[Price] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PlayerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[PlayerName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[displayplayersinfo]    Script Date: 11/10/2026 11:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[displayplayersinfo] (@Position varchar(20))
returns table
as 
return
(
    select PlayerName,TeamName,country,Price from Players where Position = @Position
)
GO
/****** Object:  Table [dbo].[PlayerPerformance]    Script Date: 11/10/2026 11:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerPerformance](
	[PlayerID] [uniqueidentifier] NOT NULL,
	[GameweekID] [int] NOT NULL,
	[Minutesplayed] [int] NULL,
	[Goalsscored] [int] NULL,
	[Assists] [int] NULL,
	[Cleansheets] [binary](1) NULL,
	[Totalpoints] [int] NULL,
 CONSTRAINT [c2] PRIMARY KEY CLUSTERED 
(
	[PlayerID] ASC,
	[GameweekID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[displayplayerperformance]    Script Date: 11/10/2026 11:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[displayplayerperformance] (@id UNIQUEIDENTIFIER ,@id2 int)
returns table
as 
return
(
    select Minutesplayed,Goalsscored,Assists,Totalpoints from playerperformance where PlayerID = @id and GameweekID = @id2
)
GO
/****** Object:  Table [dbo].[UsersTeams]    Script Date: 11/10/2026 11:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersTeams](
	[UserID] [uniqueidentifier] NOT NULL,
	[PlayerID] [uniqueidentifier] NOT NULL,
	[gameweekid] [int] NOT NULL,
 CONSTRAINT [c1] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[PlayerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[displayuserteam]    Script Date: 11/10/2026 11:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[displayuserteam] (@id UNIQUEIDENTIFIER,@gw int)
returns table
as 
return
(
    select PlayerID from UsersTeams where UserID = @id and gameweekid=@gw 
)
GO
/****** Object:  Table [dbo].[UsersLeagues]    Script Date: 11/10/2026 11:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersLeagues](
	[UserID] [uniqueidentifier] NOT NULL,
	[LeagueID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [c5] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[LeagueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[displayuserlegs]    Script Date: 11/10/2026 11:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[displayuserlegs] (@id UNIQUEIDENTIFIER)
returns table
as 
return
(
    select LeagueID from UsersLeagues where UserID = @id 
)
GO
/****** Object:  Table [dbo].[UserGameWeekHistory]    Script Date: 11/10/2026 11:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGameWeekHistory](
	[UserID] [uniqueidentifier] NOT NULL,
	[GameweekID] [int] NOT NULL,
	[GWpoints] [int] NULL,
	[Overallpoints] [int] NULL,
	[GWRank] [int] NULL,
	[OverallRank] [int] NULL,
 CONSTRAINT [c3] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[GameweekID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[displayusergwhis]    Script Date: 11/10/2026 11:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[displayusergwhis] (@id UNIQUEIDENTIFIER)
returns table
as 
return
(
    select GWpoints,Overallpoints,GWRank,OverallRank from UserGameWeekHistory where UserID = @id
)
GO
/****** Object:  Table [dbo].[GameWeek]    Script Date: 11/10/2026 11:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameWeek](
	[GameweekID] [int] NOT NULL,
	[Deadlinedate] [date] NULL,
	[Startdate] [date] NULL,
	[Enddate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[GameweekID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Leagues_cups]    Script Date: 11/10/2026 11:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leagues_cups](
	[LeagueID] [uniqueidentifier] NOT NULL,
	[Leaguename] [varchar](20) NOT NULL,
	[Leaguetype] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LeagueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transferss]    Script Date: 11/10/2026 11:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transferss](
	[UserID] [uniqueidentifier] NOT NULL,
	[PlayerID] [uniqueidentifier] NOT NULL,
	[Transferdate] [date] NULL,
	[Transfertype] [varchar](20) NULL,
	[gameweekidd] [int] NOT NULL,
 CONSTRAINT [c4] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[PlayerID] ASC,
	[gameweekidd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [myindex3]    Script Date: 11/10/2026 11:49:25 PM ******/
CREATE NONCLUSTERED INDEX [myindex3] ON [dbo].[Leagues_cups]
(
	[Leaguename] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [myindex6]    Script Date: 11/10/2026 11:49:25 PM ******/
CREATE NONCLUSTERED INDEX [myindex6] ON [dbo].[PlayerPerformance]
(
	[GameweekID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [myindex5]    Script Date: 11/10/2026 11:49:25 PM ******/
CREATE NONCLUSTERED INDEX [myindex5] ON [dbo].[Transferss]
(
	[PlayerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [myindex4]    Script Date: 11/10/2026 11:49:25 PM ******/
CREATE NONCLUSTERED INDEX [myindex4] ON [dbo].[UsersLeagues]
(
	[LeagueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Leagues_cups] ADD  DEFAULT (newid()) FOR [LeagueID]
GO
ALTER TABLE [dbo].[Players] ADD  DEFAULT (newid()) FOR [PlayerID]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (newid()) FOR [UserID]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ((0)) FOR [SquadValue]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ((100)) FOR [IntheBank]
GO
ALTER TABLE [dbo].[PlayerPerformance]  WITH CHECK ADD FOREIGN KEY([GameweekID])
REFERENCES [dbo].[GameWeek] ([GameweekID])
GO
ALTER TABLE [dbo].[PlayerPerformance]  WITH CHECK ADD FOREIGN KEY([PlayerID])
REFERENCES [dbo].[Players] ([PlayerID])
GO
ALTER TABLE [dbo].[Transferss]  WITH CHECK ADD FOREIGN KEY([gameweekidd])
REFERENCES [dbo].[GameWeek] ([GameweekID])
GO
ALTER TABLE [dbo].[Transferss]  WITH CHECK ADD FOREIGN KEY([PlayerID])
REFERENCES [dbo].[Players] ([PlayerID])
GO
ALTER TABLE [dbo].[Transferss]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[users] ([UserID])
GO
ALTER TABLE [dbo].[UserGameWeekHistory]  WITH CHECK ADD FOREIGN KEY([GameweekID])
REFERENCES [dbo].[GameWeek] ([GameweekID])
GO
ALTER TABLE [dbo].[UserGameWeekHistory]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[users] ([UserID])
GO
ALTER TABLE [dbo].[UsersLeagues]  WITH CHECK ADD FOREIGN KEY([LeagueID])
REFERENCES [dbo].[Leagues_cups] ([LeagueID])
GO
ALTER TABLE [dbo].[UsersLeagues]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[users] ([UserID])
GO
ALTER TABLE [dbo].[UsersTeams]  WITH CHECK ADD FOREIGN KEY([gameweekid])
REFERENCES [dbo].[GameWeek] ([GameweekID])
GO
ALTER TABLE [dbo].[UsersTeams]  WITH CHECK ADD FOREIGN KEY([PlayerID])
REFERENCES [dbo].[Players] ([PlayerID])
GO
ALTER TABLE [dbo].[UsersTeams]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[users] ([UserID])
GO
ALTER TABLE [dbo].[Leagues_cups]  WITH CHECK ADD  CONSTRAINT [c7] CHECK  (([Leaguetype]='public' OR [Leaguetype]='privite'))
GO
ALTER TABLE [dbo].[Leagues_cups] CHECK CONSTRAINT [c7]
GO
ALTER TABLE [dbo].[Transferss]  WITH CHECK ADD  CONSTRAINT [c6] CHECK  (([Transfertype]='in' OR [Transfertype]='out'))
GO
ALTER TABLE [dbo].[Transferss] CHECK CONSTRAINT [c6]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [cc1] CHECK  (([SquadValue]<=(100) AND [SquadValue]>=(0)))
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [cc1]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [cc2] CHECK  (([IntheBank]<=(100) AND [IntheBank]>=(0)))
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [cc2]
GO
/****** Object:  StoredProcedure [dbo].[insertleg]    Script Date: 11/10/2026 11:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insertleg] (@Leaguename varchar(20),@Leaguetype varchar(20))
as
begin
insert into Leagues_cups (Leaguename,Leaguetype )
values (@Leaguename ,@Leaguetype )
end
GO
/****** Object:  StoredProcedure [dbo].[inserttransfr]    Script Date: 11/10/2026 11:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[inserttransfr] (@userid UNIQUEIDENTIFIER,@playerid UNIQUEIDENTIFIER,@type varchar(20),@gwid int)
as
begin 
BEGIN TRY
  begin transaction
    insert into Transferss
    values (@userid ,@playerid , GETDATE(), @type ,@gwid)
    declare @x int
    select @x=Price from Players where PlayerID=@playerid
    if @type= 'in'
    begin
    update users
    set users.SquadValue += @x , users.IntheBank -= @x
    where UserID=@userid
    end
    else if @type= 'out'
    begin
    update users
    set users.SquadValue -= @x , users.IntheBank += @x
    where UserID=@userid
    end
  commit   
END TRY
BEGIN CATCH
    rollback
END CATCH
end
GO
/****** Object:  StoredProcedure [dbo].[insertuser]    Script Date: 11/10/2026 11:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insertuser] (@username varchar(20),@password varchar(20),@teamname varchar(20),@country varchar(20),@Dateofbirth date,@Gender varchar(20),@emailaddress varchar(20))
as
begin
insert into users (username ,password ,teamname ,country ,Dateofbirth, Gender ,emailaddress )
values (@username ,@password ,@teamname,@country ,@Dateofbirth,@Gender ,@emailaddress )
end
GO
/****** Object:  StoredProcedure [dbo].[insertuserteam]    Script Date: 11/10/2026 11:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[insertuserteam] (@userid UNIQUEIDENTIFIER,@newplayerid UNIQUEIDENTIFIER,@gw int)
as
begin
insert into UsersTeams
values (@userid, @newplayerid,@gw)
end
GO
/****** Object:  StoredProcedure [dbo].[updateplayerprice]    Script Date: 11/10/2026 11:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[updateplayerprice] (@playerid UNIQUEIDENTIFIER, @newprice int)
as
begin
update Players
set Price = @newprice
where PlayerID = @playerid
end
GO
/****** Object:  StoredProcedure [dbo].[updateuserteam]    Script Date: 11/10/2026 11:49:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[updateuserteam] (@userid UNIQUEIDENTIFIER, @oldplayerid UNIQUEIDENTIFIER,@gw int, @newplayerid UNIQUEIDENTIFIER)
as
begin
update UsersTeams
set PlayerID = @newplayerid
where UserID = @userid and PlayerID = @oldplayerid and gameweekid=@gw 
end
GO
USE [master]
GO
ALTER DATABASE [FPL_db] SET  READ_WRITE 
GO
