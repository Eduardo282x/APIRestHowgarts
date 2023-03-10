USE [master]
GO
/****** Object:  Database [HowgartsDB]    Script Date: 27/2/2023 10:27:09 p. m. ******/
CREATE DATABASE [HowgartsDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Howgarts', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Howgarts.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Howgarts_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Howgarts_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [HowgartsDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HowgartsDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HowgartsDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HowgartsDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HowgartsDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HowgartsDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HowgartsDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [HowgartsDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [HowgartsDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HowgartsDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HowgartsDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HowgartsDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HowgartsDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HowgartsDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HowgartsDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HowgartsDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HowgartsDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HowgartsDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HowgartsDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HowgartsDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HowgartsDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HowgartsDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HowgartsDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HowgartsDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HowgartsDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HowgartsDB] SET  MULTI_USER 
GO
ALTER DATABASE [HowgartsDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HowgartsDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HowgartsDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HowgartsDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HowgartsDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HowgartsDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [HowgartsDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [HowgartsDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [HowgartsDB]
GO
/****** Object:  Table [dbo].[Escuela]    Script Date: 27/2/2023 10:27:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Escuela](
	[IDEscuela] [int] IDENTITY(1,1) NOT NULL,
	[Escuela] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDEscuela] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estudiantes]    Script Date: 27/2/2023 10:27:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estudiantes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](20) NULL,
	[Apellido] [varchar](20) NULL,
	[cedula] [int] NULL,
	[Escuela] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Escuela] ON 

INSERT [dbo].[Escuela] ([IDEscuela], [Escuela]) VALUES (1, N'Gryffindor')
INSERT [dbo].[Escuela] ([IDEscuela], [Escuela]) VALUES (2, N'Slytherin')
INSERT [dbo].[Escuela] ([IDEscuela], [Escuela]) VALUES (3, N'Hafflepuff ')
INSERT [dbo].[Escuela] ([IDEscuela], [Escuela]) VALUES (4, N'Ravenclaw')
SET IDENTITY_INSERT [dbo].[Escuela] OFF
GO
SET IDENTITY_INSERT [dbo].[Estudiantes] ON 

INSERT [dbo].[Estudiantes] ([ID], [Nombre], [Apellido], [cedula], [Escuela]) VALUES (3, N'Zurdo', N'Derecho', 12345678, N'DonSimon')
INSERT [dbo].[Estudiantes] ([ID], [Nombre], [Apellido], [cedula], [Escuela]) VALUES (4, N'Aixa', N'Chacin', 12345678, N'slyterin')
INSERT [dbo].[Estudiantes] ([ID], [Nombre], [Apellido], [cedula], [Escuela]) VALUES (6, N'Eduardo', N'Rojas', 12345678, N'DonSimon')
SET IDENTITY_INSERT [dbo].[Estudiantes] OFF
GO
/****** Object:  StoredProcedure [dbo].[actualizar]    Script Date: 27/2/2023 10:27:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[actualizar]
@ID int,
@Nombre varchar(20),
@Apellido varchar(20),
@Cedula int,
@Escuela varchar(20)

as begin 
update Estudiantes set 
Nombre= @Nombre, 
Apellido = @Apellido, 
Cedula = @Cedula, 
Escuela = @Escuela where ID = @ID end
GO
/****** Object:  StoredProcedure [dbo].[borrar]    Script Date: 27/2/2023 10:27:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[borrar] (
@ID int
)
as 
begin
delete from Estudiantes where

ID = @ID
 end
GO
/****** Object:  StoredProcedure [dbo].[insertar]    Script Date: 27/2/2023 10:27:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[insertar] (
@Nombre varchar(20),
@Apellido varchar(20),
@Cedula int,
@Escuela varchar(20)
)
as 
begin
insert into Estudiantes(Nombre,Apellido,Cedula, Escuela)  values 
(@Nombre,@Apellido,@Cedula,@Escuela) end
GO
/****** Object:  StoredProcedure [dbo].[mostrar]    Script Date: 27/2/2023 10:27:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[mostrar] as
select * from Estudiantes 
GO
/****** Object:  StoredProcedure [dbo].[mostrarE]    Script Date: 27/2/2023 10:27:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[mostrarE] 
as begin 
select * from Escuela end
GO
/****** Object:  StoredProcedure [dbo].[mostrarUno]    Script Date: 27/2/2023 10:27:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[mostrarUno] (
@ID int
)
as 
begin
select * from Estudiantes where

ID = @ID
 end
GO
USE [master]
GO
ALTER DATABASE [HowgartsDB] SET  READ_WRITE 
GO
