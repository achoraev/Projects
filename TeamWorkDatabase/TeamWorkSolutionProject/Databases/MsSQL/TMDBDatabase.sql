USE [master]
GO
/****** Object:  Database [IMDB]    Script Date: 8/30/2014 12:17:54 PM ******/
CREATE DATABASE [IMDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IMDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\IMDB.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'IMDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\IMDB_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [IMDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IMDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IMDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IMDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IMDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IMDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IMDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [IMDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IMDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IMDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IMDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IMDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IMDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IMDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IMDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IMDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IMDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [IMDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IMDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IMDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IMDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IMDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IMDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IMDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IMDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [IMDB] SET  MULTI_USER 
GO
ALTER DATABASE [IMDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IMDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IMDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IMDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [IMDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [IMDB]
GO
/****** Object:  Table [dbo].[Awards]    Script Date: 8/30/2014 12:17:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Awards](
	[AwardID] [int] IDENTITY(1,1) NOT NULL,
	[IndustryAwardID] [int] NOT NULL,
 CONSTRAINT [PK_Awards] PRIMARY KEY CLUSTERED 
(
	[AwardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BoxOfficeEntries]    Script Date: 8/30/2014 12:17:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BoxOfficeEntries](
	[BoxOfficeEntryID] [int] IDENTITY(1,1) NOT NULL,
	[Weeks] [int] NOT NULL,
	[Weekend] [money] NOT NULL,
 CONSTRAINT [PK_BoxOfficeEntries] PRIMARY KEY CLUSTERED 
(
	[BoxOfficeEntryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Genres]    Script Date: 8/30/2014 12:17:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[GenreID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED 
(
	[GenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IndustryAwards]    Script Date: 8/30/2014 12:17:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IndustryAwards](
	[IndustryAwardID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_IndustryAwards] PRIMARY KEY CLUSTERED 
(
	[IndustryAwardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Movies]    Script Date: 8/30/2014 12:17:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[MovieID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Storyline] [nvarchar](500) NULL,
	[RunningTime] [time](7) NULL,
	[ReleaseDate] [date] NULL,
	[DirectorID] [int] NOT NULL,
	[GenreID] [int] NOT NULL,
	[BoxOfficeEntryID] [int] NOT NULL,
	[Gross] [money] NOT NULL,
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MoviesActors]    Script Date: 8/30/2014 12:17:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MoviesActors](
	[MovieID] [int] NOT NULL,
	[PersonID] [int] NOT NULL,
 CONSTRAINT [PK_MoviesActors] PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC,
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MoviesAwards]    Script Date: 8/30/2014 12:17:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MoviesAwards](
	[MovieID] [int] NOT NULL,
	[AwardID] [int] NOT NULL,
 CONSTRAINT [PK_MoviesAwards] PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC,
	[AwardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MoviesNominations]    Script Date: 8/30/2014 12:17:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MoviesNominations](
	[MovieID] [int] NOT NULL,
	[NominationID] [int] NOT NULL,
 CONSTRAINT [PK_MoviesNominations] PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC,
	[NominationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MoviesProductionCompanies]    Script Date: 8/30/2014 12:17:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MoviesProductionCompanies](
	[MovieID] [int] NOT NULL,
	[CompanyID] [int] NOT NULL,
 CONSTRAINT [PK_MoviesProductionCompanies] PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC,
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MoviesWriters]    Script Date: 8/30/2014 12:17:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MoviesWriters](
	[MovieID] [int] NOT NULL,
	[PersonID] [int] NOT NULL,
 CONSTRAINT [PK_MoviesWriters] PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC,
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Nominations]    Script Date: 8/30/2014 12:17:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nominations](
	[NominationID] [int] IDENTITY(1,1) NOT NULL,
	[IndustryAwardID] [int] NOT NULL,
 CONSTRAINT [PK_Nominations] PRIMARY KEY CLUSTERED 
(
	[NominationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Persons]    Script Date: 8/30/2014 12:17:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persons](
	[PersonID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PersonsProfessions]    Script Date: 8/30/2014 12:17:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonsProfessions](
	[PersonID] [int] NOT NULL,
	[ProfessionID] [int] NOT NULL,
 CONSTRAINT [PK_PersonsProfessions] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC,
	[ProfessionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductionCompanies]    Script Date: 8/30/2014 12:17:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductionCompanies](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ProductionCompanies] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Professions]    Script Date: 8/30/2014 12:17:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Professions](
	[ProfessionID] [int] IDENTITY(1,1) NOT NULL,
	[ProfessionType] [int] NOT NULL,
 CONSTRAINT [PK_Professions] PRIMARY KEY CLUSTERED 
(
	[ProfessionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Awards]  WITH CHECK ADD  CONSTRAINT [FK_Awards_IndustryAwards] FOREIGN KEY([IndustryAwardID])
REFERENCES [dbo].[IndustryAwards] ([IndustryAwardID])
GO
ALTER TABLE [dbo].[Awards] CHECK CONSTRAINT [FK_Awards_IndustryAwards]
GO
ALTER TABLE [dbo].[Movies]  WITH CHECK ADD  CONSTRAINT [FK_Movies_BoxOfficeEntries] FOREIGN KEY([BoxOfficeEntryID])
REFERENCES [dbo].[BoxOfficeEntries] ([BoxOfficeEntryID])
GO
ALTER TABLE [dbo].[Movies] CHECK CONSTRAINT [FK_Movies_BoxOfficeEntries]
GO
ALTER TABLE [dbo].[Movies]  WITH CHECK ADD  CONSTRAINT [FK_Movies_Genres] FOREIGN KEY([GenreID])
REFERENCES [dbo].[Genres] ([GenreID])
GO
ALTER TABLE [dbo].[Movies] CHECK CONSTRAINT [FK_Movies_Genres]
GO
ALTER TABLE [dbo].[Movies]  WITH CHECK ADD  CONSTRAINT [FK_Movies_Persons] FOREIGN KEY([DirectorID])
REFERENCES [dbo].[Persons] ([PersonID])
GO
ALTER TABLE [dbo].[Movies] CHECK CONSTRAINT [FK_Movies_Persons]
GO
ALTER TABLE [dbo].[MoviesActors]  WITH CHECK ADD  CONSTRAINT [FK_MoviesActors_Movies] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movies] ([MovieID])
GO
ALTER TABLE [dbo].[MoviesActors] CHECK CONSTRAINT [FK_MoviesActors_Movies]
GO
ALTER TABLE [dbo].[MoviesActors]  WITH CHECK ADD  CONSTRAINT [FK_MoviesActors_Persons] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Persons] ([PersonID])
GO
ALTER TABLE [dbo].[MoviesActors] CHECK CONSTRAINT [FK_MoviesActors_Persons]
GO
ALTER TABLE [dbo].[MoviesAwards]  WITH CHECK ADD  CONSTRAINT [FK_MoviesAwards_Awards] FOREIGN KEY([AwardID])
REFERENCES [dbo].[Awards] ([AwardID])
GO
ALTER TABLE [dbo].[MoviesAwards] CHECK CONSTRAINT [FK_MoviesAwards_Awards]
GO
ALTER TABLE [dbo].[MoviesAwards]  WITH CHECK ADD  CONSTRAINT [FK_MoviesAwards_Movies] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movies] ([MovieID])
GO
ALTER TABLE [dbo].[MoviesAwards] CHECK CONSTRAINT [FK_MoviesAwards_Movies]
GO
ALTER TABLE [dbo].[MoviesNominations]  WITH CHECK ADD  CONSTRAINT [FK_MoviesNominations_Movies] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movies] ([MovieID])
GO
ALTER TABLE [dbo].[MoviesNominations] CHECK CONSTRAINT [FK_MoviesNominations_Movies]
GO
ALTER TABLE [dbo].[MoviesNominations]  WITH CHECK ADD  CONSTRAINT [FK_MoviesNominations_Nominations] FOREIGN KEY([NominationID])
REFERENCES [dbo].[Nominations] ([NominationID])
GO
ALTER TABLE [dbo].[MoviesNominations] CHECK CONSTRAINT [FK_MoviesNominations_Nominations]
GO
ALTER TABLE [dbo].[MoviesProductionCompanies]  WITH CHECK ADD  CONSTRAINT [FK_MoviesProductionCompanies_Movies] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movies] ([MovieID])
GO
ALTER TABLE [dbo].[MoviesProductionCompanies] CHECK CONSTRAINT [FK_MoviesProductionCompanies_Movies]
GO
ALTER TABLE [dbo].[MoviesProductionCompanies]  WITH CHECK ADD  CONSTRAINT [FK_MoviesProductionCompanies_ProductionCompanies] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[ProductionCompanies] ([CompanyID])
GO
ALTER TABLE [dbo].[MoviesProductionCompanies] CHECK CONSTRAINT [FK_MoviesProductionCompanies_ProductionCompanies]
GO
ALTER TABLE [dbo].[MoviesWriters]  WITH CHECK ADD  CONSTRAINT [FK_MoviesWriters_Movies] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movies] ([MovieID])
GO
ALTER TABLE [dbo].[MoviesWriters] CHECK CONSTRAINT [FK_MoviesWriters_Movies]
GO
ALTER TABLE [dbo].[MoviesWriters]  WITH CHECK ADD  CONSTRAINT [FK_MoviesWriters_Persons] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Persons] ([PersonID])
GO
ALTER TABLE [dbo].[MoviesWriters] CHECK CONSTRAINT [FK_MoviesWriters_Persons]
GO
ALTER TABLE [dbo].[Nominations]  WITH CHECK ADD  CONSTRAINT [FK_Nominations_IndustryAwards] FOREIGN KEY([IndustryAwardID])
REFERENCES [dbo].[IndustryAwards] ([IndustryAwardID])
GO
ALTER TABLE [dbo].[Nominations] CHECK CONSTRAINT [FK_Nominations_IndustryAwards]
GO
ALTER TABLE [dbo].[PersonsProfessions]  WITH CHECK ADD  CONSTRAINT [FK_PersonsProfessions_Persons] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Persons] ([PersonID])
GO
ALTER TABLE [dbo].[PersonsProfessions] CHECK CONSTRAINT [FK_PersonsProfessions_Persons]
GO
ALTER TABLE [dbo].[PersonsProfessions]  WITH CHECK ADD  CONSTRAINT [FK_PersonsProfessions_Professions] FOREIGN KEY([ProfessionID])
REFERENCES [dbo].[Professions] ([ProfessionID])
GO
ALTER TABLE [dbo].[PersonsProfessions] CHECK CONSTRAINT [FK_PersonsProfessions_Professions]
GO
USE [master]
GO
ALTER DATABASE [IMDB] SET  READ_WRITE 
GO
