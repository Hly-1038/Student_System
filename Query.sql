USE [master]
GO
/****** Object:  Database [Student_System]    Script Date: 24.01.2022 22:14:49 ******/
CREATE DATABASE [Student_System]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Student_System', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Student_System.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Student_System_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Student_System_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Student_System] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Student_System].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Student_System] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Student_System] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Student_System] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Student_System] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Student_System] SET ARITHABORT OFF 
GO
ALTER DATABASE [Student_System] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Student_System] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Student_System] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Student_System] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Student_System] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Student_System] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Student_System] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Student_System] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Student_System] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Student_System] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Student_System] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Student_System] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Student_System] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Student_System] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Student_System] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Student_System] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Student_System] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Student_System] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Student_System] SET  MULTI_USER 
GO
ALTER DATABASE [Student_System] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Student_System] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Student_System] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Student_System] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Student_System] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Student_System] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Student_System] SET QUERY_STORE = OFF
GO
USE [Student_System]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 24.01.2022 22:14:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[student_id] [int] IDENTITY(1,1) NOT NULL,
	[student_firstname] [nvarchar](30) NOT NULL,
	[student_lastname] [nvarchar](40) NOT NULL,
	[student_birthdate] [date] NOT NULL,
	[student_gender] [nchar](6) NOT NULL,
	[student_phone] [nchar](10) NOT NULL,
	[student_address] [nvarchar](300) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_1]    Script Date: 24.01.2022 22:14:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT student_id, student_firstname, student_lastname
FROM Student
GO
/****** Object:  Table [dbo].[Score]    Script Date: 24.01.2022 22:14:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Score](
	[score_id] [int] IDENTITY(1,1) NOT NULL,
	[score_course] [nvarchar](50) NOT NULL,
	[student_id] [int] NOT NULL,
	[score] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_2]    Script Date: 24.01.2022 22:14:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_2]
AS
SELECT student_id, score_course, score
FROM Score
GO
/****** Object:  Table [dbo].[Course]    Script Date: 24.01.2022 22:14:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[course_id] [int] IDENTITY(1,1) NOT NULL,
	[course_label] [nchar](50) NOT NULL,
	[hourse_number] [int] NOT NULL,
	[department_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 24.01.2022 22:14:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[department_id] [int] IDENTITY(1,1) NOT NULL,
	[department_name] [nvarchar](60) NOT NULL,
	[student_no] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 24.01.2022 22:14:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 24.01.2022 22:14:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[teacher_id] [int] IDENTITY(1,1) NOT NULL,
	[teacher_name] [nvarchar](50) NOT NULL,
	[teacher_lastname] [nvarchar](50) NOT NULL,
	[teacher_phone] [nvarchar](50) NOT NULL,
	[course_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[teacher_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([course_id], [course_label], [hourse_number], [department_id]) VALUES (13, N'economy                                           ', 2, 34)
INSERT [dbo].[Course] ([course_id], [course_label], [hourse_number], [department_id]) VALUES (19, N'Database management System                        ', 4, 35)
INSERT [dbo].[Course] ([course_id], [course_label], [hourse_number], [department_id]) VALUES (21, N'finance                                           ', 6, 44)
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([department_id], [department_name], [student_no]) VALUES (34, N'Economics                                                   ', 15)
INSERT [dbo].[Department] ([department_id], [department_name], [student_no]) VALUES (35, N'Computer Science                                            ', 16)
INSERT [dbo].[Department] ([department_id], [department_name], [student_no]) VALUES (42, N'Chemistry and Biochemistry                                  ', 17)
INSERT [dbo].[Department] ([department_id], [department_name], [student_no]) VALUES (44, N'Economics                                                   ', 20)
SET IDENTITY_INSERT [dbo].[Department] OFF
GO

SET IDENTITY_INSERT [dbo].[Score] ON 

INSERT [dbo].[Score] ([score_id], [score_course], [student_id], [score]) VALUES (8, N'economy                                           ', 16, 90)
INSERT [dbo].[Score] ([score_id], [score_course], [student_id], [score]) VALUES (10, N'finance                                           ', 20, 100)
INSERT [dbo].[Score] ([score_id], [score_course], [student_id], [score]) VALUES (9, N'economy                                           ', 15, 100)
SET IDENTITY_INSERT [dbo].[Score] OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([student_id], [student_firstname], [student_lastname], [student_birthdate], [student_gender], [student_phone], [student_address]) VALUES (15, N'Merve                         ', N'Onaran                                  ', CAST(N'2000-04-26' AS Date), N'Female', N'0532435546', N' İstanbul                                                                                                                                                                                                                                                                                                   ')
INSERT [dbo].[Student] ([student_id], [student_firstname], [student_lastname], [student_birthdate], [student_gender], [student_phone], [student_address]) VALUES (16, N'Kübra                         ', N'Bozalp                                  ', CAST(N'2000-05-23' AS Date), N'Female', N'0545345544', N' Mersin                                                                                                                                                                                                                                                                                                     ')
INSERT [dbo].[Student] ([student_id], [student_firstname], [student_lastname], [student_birthdate], [student_gender], [student_phone], [student_address]) VALUES (17, N'Hülya                         ', N'Öğüt                                    ', CAST(N'1998-06-10' AS Date), N'Female', N'0534546879', N' Konya                                                                                                                                                                                                                                                                                                      ')
INSERT [dbo].[Student] ([student_id], [student_firstname], [student_lastname], [student_birthdate], [student_gender], [student_phone], [student_address]) VALUES (20, N'Gamze                         ', N'Gökçil                                  ', CAST(N'1999-01-29' AS Date), N'Female', N'0654123456', N' Bursa                                                                                                                                                                                                                                                                                                      ')
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([teacher_id], [teacher_name], [teacher_lastname], [teacher_phone], [course_id]) VALUES (21, N'Mert                                              ', N'Uyar                                              ', N'09876545434                                       ', 13)
INSERT [dbo].[Teacher] ([teacher_id], [teacher_name], [teacher_lastname], [teacher_phone], [course_id]) VALUES (28, N'hatice                                            ', N'şen                                               ', N'0987362547                                        ', 21)
SET IDENTITY_INSERT [dbo].[Teacher] OFF
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD FOREIGN KEY([department_id])
REFERENCES [dbo].[Department] ([department_id])
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_pos_cus_2_Cascade] FOREIGN KEY([department_id])
REFERENCES [dbo].[Department] ([department_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_pos_cus_2_Cascade]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD FOREIGN KEY([student_no])
REFERENCES [dbo].[Student] ([student_id])
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_pos_cus_3_Cascade] FOREIGN KEY([student_no])
REFERENCES [dbo].[Student] ([student_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_pos_cus_3_Cascade]
GO
ALTER TABLE [dbo].[Score]  WITH CHECK ADD  CONSTRAINT [FK__Score__student_i__4E53A1AA] FOREIGN KEY([student_id])
REFERENCES [dbo].[Student] ([student_id])
GO
ALTER TABLE [dbo].[Score] CHECK CONSTRAINT [FK__Score__student_i__4E53A1AA]
GO
ALTER TABLE [dbo].[Score]  WITH CHECK ADD  CONSTRAINT [FK_pos_cus_4_Cascade] FOREIGN KEY([student_id])
REFERENCES [dbo].[Student] ([student_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Score] CHECK CONSTRAINT [FK_pos_cus_4_Cascade]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD FOREIGN KEY([course_id])
REFERENCES [dbo].[Course] ([course_id])
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_pos_cus_Cascade] FOREIGN KEY([course_id])
REFERENCES [dbo].[Course] ([course_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_pos_cus_Cascade]
GO
/****** Object:  StoredProcedure [dbo].[sp_Student]    Script Date: 24.01.2022 22:14:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Student]
@student_id INT 
AS 
BEGIN 
SELECT * FROM dbo.Student WHERE student_id=@student_id
END

GO
USE [master]
GO
ALTER DATABASE [Student_System] SET  READ_WRITE 
GO
