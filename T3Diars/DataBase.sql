USE [master]
GO
/****** Object:  Database [T3Diars]    Script Date: 5/11/2020 21:52:13 ******/
CREATE DATABASE [T3Diars]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'T3Diars', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\T3Diars.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'T3Diars_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\T3Diars_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [T3Diars] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [T3Diars].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [T3Diars] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [T3Diars] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [T3Diars] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [T3Diars] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [T3Diars] SET ARITHABORT OFF 
GO
ALTER DATABASE [T3Diars] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [T3Diars] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [T3Diars] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [T3Diars] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [T3Diars] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [T3Diars] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [T3Diars] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [T3Diars] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [T3Diars] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [T3Diars] SET  DISABLE_BROKER 
GO
ALTER DATABASE [T3Diars] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [T3Diars] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [T3Diars] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [T3Diars] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [T3Diars] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [T3Diars] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [T3Diars] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [T3Diars] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [T3Diars] SET  MULTI_USER 
GO
ALTER DATABASE [T3Diars] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [T3Diars] SET DB_CHAINING OFF 
GO
ALTER DATABASE [T3Diars] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [T3Diars] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [T3Diars] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [T3Diars] SET QUERY_STORE = OFF
GO
USE [T3Diars]
GO
/****** Object:  Table [dbo].[Ejercicio]    Script Date: 5/11/2020 21:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ejercicio](
	[idEjercicio] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[linkVideo] [varchar](200) NULL,
 CONSTRAINT [PK_Ejercicio] PRIMARY KEY CLUSTERED 
(
	[idEjercicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rutina]    Script Date: 5/11/2020 21:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rutina](
	[idRutina] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[tipo] [varchar](100) NULL,
	[idCreador] [int] NULL,
 CONSTRAINT [PK_Rutina] PRIMARY KEY CLUSTERED 
(
	[idRutina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RutinaEjercicio]    Script Date: 5/11/2020 21:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RutinaEjercicio](
	[idRutinaEjercicio] [int] IDENTITY(1,1) NOT NULL,
	[idEjercicio] [int] NULL,
	[idRutina] [int] NULL,
	[tiempo] [int] NULL,
 CONSTRAINT [PK_RutinaEjercicio] PRIMARY KEY CLUSTERED 
(
	[idRutinaEjercicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 5/11/2020 21:52:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[nombreCompleto] [varchar](100) NULL,
	[usuario] [varchar](100) NULL,
	[passwd] [varchar](200) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [T3Diars] SET  READ_WRITE 
GO
