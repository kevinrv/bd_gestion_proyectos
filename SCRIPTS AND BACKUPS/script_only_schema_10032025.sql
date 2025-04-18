USE [master]
GO
/****** Object:  Database [bd_gestion_proyectos]    Script Date: 10/03/2025 21:26:25 ******/
CREATE DATABASE [bd_gestion_proyectos]

ALTER DATABASE [bd_gestion_proyectos] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bd_gestion_proyectos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bd_gestion_proyectos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bd_gestion_proyectos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bd_gestion_proyectos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bd_gestion_proyectos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bd_gestion_proyectos] SET ARITHABORT OFF 
GO
ALTER DATABASE [bd_gestion_proyectos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bd_gestion_proyectos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bd_gestion_proyectos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bd_gestion_proyectos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bd_gestion_proyectos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bd_gestion_proyectos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bd_gestion_proyectos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bd_gestion_proyectos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bd_gestion_proyectos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bd_gestion_proyectos] SET  ENABLE_BROKER 
GO
ALTER DATABASE [bd_gestion_proyectos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bd_gestion_proyectos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bd_gestion_proyectos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bd_gestion_proyectos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bd_gestion_proyectos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bd_gestion_proyectos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bd_gestion_proyectos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bd_gestion_proyectos] SET RECOVERY FULL 
GO
ALTER DATABASE [bd_gestion_proyectos] SET  MULTI_USER 
GO
ALTER DATABASE [bd_gestion_proyectos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bd_gestion_proyectos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bd_gestion_proyectos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bd_gestion_proyectos] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [bd_gestion_proyectos] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [bd_gestion_proyectos] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'bd_gestion_proyectos', N'ON'
GO
ALTER DATABASE [bd_gestion_proyectos] SET QUERY_STORE = OFF
GO
USE [bd_gestion_proyectos]
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 10/03/2025 21:26:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](10) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[sector] [varchar](75) NULL,
	[pais] [varchar](100) NULL,
	[email] [varchar](55) NULL,
	[telefono] [varchar](25) NULL,
	[identificador_cliente] [varchar](30) NULL,
	[direccion] [varchar](255) NULL,
	[web_url] [varchar](100) NULL,
	[tipo] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [identificador_cliente_CONSTRAINT] UNIQUE NONCLUSTERED 
(
	[identificador_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cuotas]    Script Date: 10/03/2025 21:26:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cuotas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[proyecto_id] [int] NOT NULL,
	[numero_cuota] [int] NOT NULL,
	[monto_cuota] [money] NOT NULL,
	[fecha_pago] [datetime] NOT NULL,
	[fecha_vencimiento] [datetime] NOT NULL,
	[estado] [varchar](100) NULL,
	[penalidad] [decimal](9, 2) NULL,
	[horas_facturadas] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalles_equipos]    Script Date: 10/03/2025 21:26:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalles_equipos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[equipo_id] [int] NOT NULL,
	[empleado_id] [int] NOT NULL,
	[horas_asignadas] [decimal](9, 2) NOT NULL,
	[rol] [varchar](100) NOT NULL,
	[fecha_asignacion] [datetime] NOT NULL,
	[fecha_termino_asignacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empleados]    Script Date: 10/03/2025 21:26:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleados](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[profesion_id] [int] NULL,
	[nombres] [varchar](155) NOT NULL,
	[apellido_paterno] [varchar](155) NOT NULL,
	[numero_documento] [varchar](20) NOT NULL,
	[email_personal] [varchar](155) NOT NULL,
	[email_institucional] [varchar](155) NULL,
	[celular] [varchar](20) NULL,
	[fecha_ingreso] [date] NOT NULL,
	[fecha_fin_contrato] [date] NULL,
	[apellido_materno] [varchar](155) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[equipos]    Script Date: 10/03/2025 21:26:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[equipos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[proyecto_id] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[fecha_fin] [datetime] NULL,
	[num_integrantes] [int] NULL,
	[presupuesto_asignado] [money] NULL,
	[funciones] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pagos]    Script Date: 10/03/2025 21:26:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pagos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cuota_id] [int] NOT NULL,
	[numero_operacion] [varchar](25) NOT NULL,
	[fecha_pago] [datetime] NOT NULL,
	[concepto_pago] [varchar](100) NULL,
	[monto_pagado] [money] NOT NULL,
	[entidad_bancaria] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[profesiones]    Script Date: 10/03/2025 21:26:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[profesiones](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](155) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[proyectos]    Script Date: 10/03/2025 21:26:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proyectos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cliente_id] [int] NOT NULL,
	[codigo] [varchar](20) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[descripcion] [varchar](max) NULL,
	[fecha_inicio] [date] NULL,
	[fecha_fin] [date] NULL,
	[estado] [varchar](55) NOT NULL,
	[presupuesto_asignado] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[pagos] ADD  DEFAULT (getdate()) FOR [fecha_pago]
GO
ALTER TABLE [dbo].[cuotas]  WITH CHECK ADD FOREIGN KEY([proyecto_id])
REFERENCES [dbo].[proyectos] ([id])
GO
ALTER TABLE [dbo].[detalles_equipos]  WITH CHECK ADD FOREIGN KEY([empleado_id])
REFERENCES [dbo].[empleados] ([id])
GO
ALTER TABLE [dbo].[detalles_equipos]  WITH CHECK ADD FOREIGN KEY([equipo_id])
REFERENCES [dbo].[equipos] ([id])
GO
ALTER TABLE [dbo].[empleados]  WITH CHECK ADD  CONSTRAINT [fk_profesion_id] FOREIGN KEY([profesion_id])
REFERENCES [dbo].[profesiones] ([id])
GO
ALTER TABLE [dbo].[empleados] CHECK CONSTRAINT [fk_profesion_id]
GO
ALTER TABLE [dbo].[equipos]  WITH CHECK ADD FOREIGN KEY([proyecto_id])
REFERENCES [dbo].[proyectos] ([id])
GO
ALTER TABLE [dbo].[pagos]  WITH CHECK ADD FOREIGN KEY([cuota_id])
REFERENCES [dbo].[cuotas] ([id])
GO
ALTER TABLE [dbo].[proyectos]  WITH CHECK ADD  CONSTRAINT [fk_proyectos_cliente_id] FOREIGN KEY([cliente_id])
REFERENCES [dbo].[clientes] ([id])
GO
ALTER TABLE [dbo].[proyectos] CHECK CONSTRAINT [fk_proyectos_cliente_id]
GO
/****** Object:  StoredProcedure [dbo].[sp_kv_generar_cuotas]    Script Date: 10/03/2025 21:26:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_kv_generar_cuotas]  
	@id_proyecto INT
AS 
BEGIN
 DECLARE @monto_cuota MONEY;
 DECLARE @fecha_pago DATETIME;
 DECLARE @fecha_vencimiento DATETIME;
 DECLARE @horas_facturadas INT;
 DECLARE @num_cuotas INT;
 DECLARE @Counter INT;

 SELECT
	@num_cuotas = DATEDIFF(MONTH, p.fecha_inicio, p.fecha_fin),
	@horas_facturadas = SUM(de.horas_asignadas)*20,
	@monto_cuota= (SUM(de.horas_asignadas)*20)*50
FROM proyectos p
INNER JOIN equipos e ON e.proyecto_id=p.id
INNER JOIN detalles_equipos de ON de.equipo_id=e.id
WHERE p.id=@id_proyecto
GROUP BY p.fecha_inicio, p.fecha_fin;

SELECT @fecha_pago = fecha_inicio, @fecha_vencimiento=fecha_fin  FROM proyectos WHERE id=@id_proyecto;

SET @Counter = 1

WHILE @Counter <= @num_cuotas

BEGIN

INSERT INTO cuotas 
VALUES (@id_proyecto,@Counter,@monto_cuota,DATEADD(MONTH, @Counter,@fecha_pago), DATEADD(MONTH, @Counter,@fecha_vencimiento),'creado','0.00',@horas_facturadas)

SET @Counter = @Counter + 1
END

END
GO
USE [master]
GO
ALTER DATABASE [bd_gestion_proyectos] SET  READ_WRITE 
GO
