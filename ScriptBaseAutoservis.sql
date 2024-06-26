USE [master]
GO
/****** Object:  Database [name_database]    Script Date: 29.05.2024 13:04:55 ******/
CREATE DATABASE [name_database]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'name_database', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\name_database.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'name_database_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\name_database_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [name_database] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [name_database].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [name_database] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [name_database] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [name_database] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [name_database] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [name_database] SET ARITHABORT OFF 
GO
ALTER DATABASE [name_database] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [name_database] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [name_database] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [name_database] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [name_database] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [name_database] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [name_database] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [name_database] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [name_database] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [name_database] SET  DISABLE_BROKER 
GO
ALTER DATABASE [name_database] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [name_database] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [name_database] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [name_database] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [name_database] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [name_database] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [name_database] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [name_database] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [name_database] SET  MULTI_USER 
GO
ALTER DATABASE [name_database] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [name_database] SET DB_CHAINING OFF 
GO
ALTER DATABASE [name_database] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [name_database] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [name_database] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [name_database] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [name_database] SET QUERY_STORE = OFF
GO
USE [name_database]
GO
/****** Object:  Table [dbo].[order]    Script Date: 29.05.2024 13:04:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[datecreation] [date] NOT NULL,
	[orderstatus] [nvarchar](50) NOT NULL,
	[paymentstatus] [nvarchar](50) NOT NULL,
	[carelement] [nvarchar](50) NOT NULL,
	[details] [nvarchar](50) NOT NULL,
	[amountdamage] [int] NOT NULL,
	[liquids] [nvarchar](50) NOT NULL,
	[orderid] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [order_pk] PRIMARY KEY CLUSTERED 
(
	[orderid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderuserlist]    Script Date: 29.05.2024 13:04:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderuserlist](
	[orderuserlistid] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NOT NULL,
	[orderid] [int] NOT NULL,
 CONSTRAINT [orderuserlist_pk] PRIMARY KEY CLUSTERED 
(
	[orderuserlistid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shift]    Script Date: 29.05.2024 13:04:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shift](
	[shiftid] [int] IDENTITY(1,1) NOT NULL,
	[datestart] [date] NOT NULL,
	[dateend] [date] NOT NULL,
 CONSTRAINT [shift_pk] PRIMARY KEY CLUSTERED 
(
	[shiftid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 29.05.2024 13:04:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[userid] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[status] [nvarchar](50) NULL,
	[lastname] [nvarchar](50) NOT NULL,
	[firstname] [nvarchar](50) NOT NULL,
	[middlename] [nvarchar](50) NOT NULL,
	[userroleid] [int] NOT NULL,
 CONSTRAINT [user_pk] PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userlist]    Script Date: 29.05.2024 13:04:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userlist](
	[userlistid] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NOT NULL,
	[shiftid] [int] NOT NULL,
 CONSTRAINT [userlist_pk] PRIMARY KEY CLUSTERED 
(
	[userlistid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userrole]    Script Date: 29.05.2024 13:04:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userrole](
	[userroleid] [int] IDENTITY(1,1) NOT NULL,
	[namerole] [nvarchar](50) NOT NULL,
 CONSTRAINT [userrole_pk] PRIMARY KEY CLUSTERED 
(
	[userroleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[order] ON 

INSERT [dbo].[order] ([datecreation], [orderstatus], [paymentstatus], [carelement], [details], [amountdamage], [liquids], [orderid]) VALUES (CAST(N'2023-06-06' AS Date), N'готовится', N'принят', N'блок воздуходувки', N'мотор вентилятора', 1, N'отсутствуют', 1)
INSERT [dbo].[order] ([datecreation], [orderstatus], [paymentstatus], [carelement], [details], [amountdamage], [liquids], [orderid]) VALUES (CAST(N'2023-06-07' AS Date), N'готов', N'оплачен', N'топливный инжектор', N'уплотнительные кольца', 8, N'отсутствуют', 2)
INSERT [dbo].[order] ([datecreation], [orderstatus], [paymentstatus], [carelement], [details], [amountdamage], [liquids], [orderid]) VALUES (CAST(N'2023-06-08' AS Date), N'готовится', N'принят', N'система охлаждения двигателя', N'насос водяной', 1, N'антифриз', 3)
INSERT [dbo].[order] ([datecreation], [orderstatus], [paymentstatus], [carelement], [details], [amountdamage], [liquids], [orderid]) VALUES (CAST(N'2023-06-09' AS Date), N'готов', N'оплачен', N'электрооборудование', N'генератор', 1, N'отсутствуют', 4)
INSERT [dbo].[order] ([datecreation], [orderstatus], [paymentstatus], [carelement], [details], [amountdamage], [liquids], [orderid]) VALUES (CAST(N'2023-06-10' AS Date), N'готов', N'принят', N'передняя часть двигателя', N'рем комлект ГРМ', 1, N'моторное масло', 5)
SET IDENTITY_INSERT [dbo].[order] OFF
GO
SET IDENTITY_INSERT [dbo].[orderuserlist] ON 

INSERT [dbo].[orderuserlist] ([orderuserlistid], [userid], [orderid]) VALUES (1, 6, 2)
INSERT [dbo].[orderuserlist] ([orderuserlistid], [userid], [orderid]) VALUES (3, 7, 5)
INSERT [dbo].[orderuserlist] ([orderuserlistid], [userid], [orderid]) VALUES (4, 9, 3)
SET IDENTITY_INSERT [dbo].[orderuserlist] OFF
GO
SET IDENTITY_INSERT [dbo].[shift] ON 

INSERT [dbo].[shift] ([shiftid], [datestart], [dateend]) VALUES (1, CAST(N'2023-01-01' AS Date), CAST(N'2023-01-05' AS Date))
INSERT [dbo].[shift] ([shiftid], [datestart], [dateend]) VALUES (2, CAST(N'2023-02-08' AS Date), CAST(N'2023-02-15' AS Date))
INSERT [dbo].[shift] ([shiftid], [datestart], [dateend]) VALUES (3, CAST(N'2023-03-19' AS Date), CAST(N'2023-03-28' AS Date))
INSERT [dbo].[shift] ([shiftid], [datestart], [dateend]) VALUES (4, CAST(N'2023-04-09' AS Date), CAST(N'2023-04-15' AS Date))
INSERT [dbo].[shift] ([shiftid], [datestart], [dateend]) VALUES (5, CAST(N'2023-05-08' AS Date), CAST(N'2023-05-18' AS Date))
SET IDENTITY_INSERT [dbo].[shift] OFF
GO
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([userid], [Login], [password], [status], [lastname], [firstname], [middlename], [userroleid]) VALUES (2, N'rubies', N'cmjcFvB3cI', N'Работает', N'Селиванов', N'Николай', N'Даниилович', 1)
INSERT [dbo].[user] ([userid], [Login], [password], [status], [lastname], [firstname], [middlename], [userroleid]) VALUES (3, N'windle', N'2PAUAd0gMZ', N'Уволен(а)', N'Афанасьев', N'Никита', N'Львович', 2)
INSERT [dbo].[user] ([userid], [Login], [password], [status], [lastname], [firstname], [middlename], [userroleid]) VALUES (4, N'improv', N'bcFFGU16f6', N'Работает', N'Кириллова', N'Мария', N'Львовна', 2)
INSERT [dbo].[user] ([userid], [Login], [password], [status], [lastname], [firstname], [middlename], [userroleid]) VALUES (5, N'moving', N'A8HPZz9HTG', N'Работает', N'Савина', N'Анна', N'Серафимовна', 1)
INSERT [dbo].[user] ([userid], [Login], [password], [status], [lastname], [firstname], [middlename], [userroleid]) VALUES (6, N'bellum', N'ZjXm3JW7RJ', N'Уволен(а)', N'Зайцева', N'Алиса', N'Адамовна', 3)
INSERT [dbo].[user] ([userid], [Login], [password], [status], [lastname], [firstname], [middlename], [userroleid]) VALUES (7, N'siller', N'dVMfx1VMFF', N'Уволен(а)', N'Фадеев', N'Степан', N'Романович', 3)
INSERT [dbo].[user] ([userid], [Login], [password], [status], [lastname], [firstname], [middlename], [userroleid]) VALUES (8, N'ragman', N'25Y9oOkwHn', N'Работает', N'Яковлева', N'Ева', N'Максимовна', 1)
INSERT [dbo].[user] ([userid], [Login], [password], [status], [lastname], [firstname], [middlename], [userroleid]) VALUES (9, N'fautor', N'RJ41C0qynP', N'Работает', N'Зиновьев', N'Станислав', N'Демидович', 3)
INSERT [dbo].[user] ([userid], [Login], [password], [status], [lastname], [firstname], [middlename], [userroleid]) VALUES (10, N'coated', N'8g2FubQVZH', N'Уволен(а)', N'Корнев', N'Андрей', N'Ильич', 1)
INSERT [dbo].[user] ([userid], [Login], [password], [status], [lastname], [firstname], [middlename], [userroleid]) VALUES (11, N'fiches', N'LO1qRB42GP', N'Работает', N'Кондрашов', N'Иван', N'Даниилович', 2)
SET IDENTITY_INSERT [dbo].[user] OFF
GO
SET IDENTITY_INSERT [dbo].[userlist] ON 

INSERT [dbo].[userlist] ([userlistid], [userid], [shiftid]) VALUES (3, 2, 1)
INSERT [dbo].[userlist] ([userlistid], [userid], [shiftid]) VALUES (4, 3, 3)
INSERT [dbo].[userlist] ([userlistid], [userid], [shiftid]) VALUES (5, 4, 5)
INSERT [dbo].[userlist] ([userlistid], [userid], [shiftid]) VALUES (6, 5, 2)
INSERT [dbo].[userlist] ([userlistid], [userid], [shiftid]) VALUES (7, 6, 4)
INSERT [dbo].[userlist] ([userlistid], [userid], [shiftid]) VALUES (8, 7, 1)
INSERT [dbo].[userlist] ([userlistid], [userid], [shiftid]) VALUES (9, 8, 3)
INSERT [dbo].[userlist] ([userlistid], [userid], [shiftid]) VALUES (10, 9, 5)
SET IDENTITY_INSERT [dbo].[userlist] OFF
GO
SET IDENTITY_INSERT [dbo].[userrole] ON 

INSERT [dbo].[userrole] ([userroleid], [namerole]) VALUES (1, N'Автомеханик')
INSERT [dbo].[userrole] ([userroleid], [namerole]) VALUES (2, N'Мастер приемщик')
INSERT [dbo].[userrole] ([userroleid], [namerole]) VALUES (3, N'Автодиагност')
SET IDENTITY_INSERT [dbo].[userrole] OFF
GO
ALTER TABLE [dbo].[orderuserlist]  WITH CHECK ADD  CONSTRAINT [orderuserlist___fk] FOREIGN KEY([userid])
REFERENCES [dbo].[user] ([userid])
GO
ALTER TABLE [dbo].[orderuserlist] CHECK CONSTRAINT [orderuserlist___fk]
GO
ALTER TABLE [dbo].[orderuserlist]  WITH CHECK ADD  CONSTRAINT [orderuserlist___fk_2] FOREIGN KEY([orderid])
REFERENCES [dbo].[order] ([orderid])
GO
ALTER TABLE [dbo].[orderuserlist] CHECK CONSTRAINT [orderuserlist___fk_2]
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD  CONSTRAINT [user___fk] FOREIGN KEY([userroleid])
REFERENCES [dbo].[userrole] ([userroleid])
GO
ALTER TABLE [dbo].[user] CHECK CONSTRAINT [user___fk]
GO
ALTER TABLE [dbo].[userlist]  WITH CHECK ADD  CONSTRAINT [userlist___fk] FOREIGN KEY([userid])
REFERENCES [dbo].[user] ([userid])
GO
ALTER TABLE [dbo].[userlist] CHECK CONSTRAINT [userlist___fk]
GO
ALTER TABLE [dbo].[userlist]  WITH CHECK ADD  CONSTRAINT [userlist___fk_2] FOREIGN KEY([shiftid])
REFERENCES [dbo].[shift] ([shiftid])
GO
ALTER TABLE [dbo].[userlist] CHECK CONSTRAINT [userlist___fk_2]
GO
USE [master]
GO
ALTER DATABASE [name_database] SET  READ_WRITE 
GO
