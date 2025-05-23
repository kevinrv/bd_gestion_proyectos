USE [master]
GO
/****** Object:  Database [bd_gestion_proyectos_bi]    Script Date: 21/03/2025 20:12:57 ******/
CREATE DATABASE [bd_gestion_proyectos_bi]

ALTER DATABASE [bd_gestion_proyectos_bi] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bd_gestion_proyectos_bi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bd_gestion_proyectos_bi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bd_gestion_proyectos_bi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bd_gestion_proyectos_bi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bd_gestion_proyectos_bi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bd_gestion_proyectos_bi] SET ARITHABORT OFF 
GO
ALTER DATABASE [bd_gestion_proyectos_bi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bd_gestion_proyectos_bi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bd_gestion_proyectos_bi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bd_gestion_proyectos_bi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bd_gestion_proyectos_bi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bd_gestion_proyectos_bi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bd_gestion_proyectos_bi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bd_gestion_proyectos_bi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bd_gestion_proyectos_bi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bd_gestion_proyectos_bi] SET  ENABLE_BROKER 
GO
ALTER DATABASE [bd_gestion_proyectos_bi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bd_gestion_proyectos_bi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bd_gestion_proyectos_bi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bd_gestion_proyectos_bi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bd_gestion_proyectos_bi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bd_gestion_proyectos_bi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bd_gestion_proyectos_bi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bd_gestion_proyectos_bi] SET RECOVERY FULL 
GO
ALTER DATABASE [bd_gestion_proyectos_bi] SET  MULTI_USER 
GO
ALTER DATABASE [bd_gestion_proyectos_bi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bd_gestion_proyectos_bi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bd_gestion_proyectos_bi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bd_gestion_proyectos_bi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [bd_gestion_proyectos_bi] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [bd_gestion_proyectos_bi] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'bd_gestion_proyectos_bi', N'ON'
GO
ALTER DATABASE [bd_gestion_proyectos_bi] SET QUERY_STORE = OFF
GO
USE [bd_gestion_proyectos_bi]
GO
/****** Object:  Table [dbo].[dim_empleado]    Script Date: 21/03/2025 20:12:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_empleado](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[empleado_id] [int] NOT NULL,
	[empleado] [varchar](467) NULL,
	[profesion] [varchar](155) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_equipo]    Script Date: 21/03/2025 20:12:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_equipo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[equipo_id] [int] NOT NULL,
	[equipo] [varchar](100) NULL,
	[presupuesto_asignado] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_proyecto]    Script Date: 21/03/2025 20:12:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_proyecto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[proyecto_id] [int] NOT NULL,
	[proyecto] [varchar](255) NULL,
	[cliente] [varchar](100) NULL,
	[estado] [varchar](55) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_tiempo]    Script Date: 21/03/2025 20:12:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_tiempo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha_asignacion] [datetime] NOT NULL,
	[mes] [varchar](20) NULL,
	[anio] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fac_table_desempenios]    Script Date: 21/03/2025 20:12:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fac_table_desempenios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dim_tiempo_id] [int] NULL,
	[dim_equipo_id] [int] NULL,
	[dim_empleado_id] [int] NULL,
	[dim_proyecto_id] [int] NULL,
	[horas_asignadas] [int] NULL,
	[horas_facturadas] [int] NULL,
	[monto_facturado] [int] NULL,
	[tiempo_asignado_meses] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[fac_table_desempenios]  WITH CHECK ADD FOREIGN KEY([dim_equipo_id])
REFERENCES [dbo].[dim_equipo] ([id])
GO
ALTER TABLE [dbo].[fac_table_desempenios]  WITH CHECK ADD FOREIGN KEY([dim_empleado_id])
REFERENCES [dbo].[dim_empleado] ([id])
GO
ALTER TABLE [dbo].[fac_table_desempenios]  WITH CHECK ADD FOREIGN KEY([dim_proyecto_id])
REFERENCES [dbo].[dim_proyecto] ([id])
GO
ALTER TABLE [dbo].[fac_table_desempenios]  WITH CHECK ADD FOREIGN KEY([dim_tiempo_id])
REFERENCES [dbo].[dim_tiempo] ([id])
GO
USE [master]
GO
ALTER DATABASE [bd_gestion_proyectos_bi] SET  READ_WRITE 
GO
