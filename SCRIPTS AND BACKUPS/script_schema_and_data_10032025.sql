USE [master]
GO
/****** Object:  Database [bd_gestion_proyectos]    Script Date: 10/03/2025 21:25:34 ******/
CREATE DATABASE [bd_gestion_proyectos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bd_gestion_proyectos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\bd_gestion_proyectos.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'bd_gestion_proyectos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\bd_gestion_proyectos_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
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
/****** Object:  Table [dbo].[clientes]    Script Date: 10/03/2025 21:25:34 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cuotas]    Script Date: 10/03/2025 21:25:34 ******/
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
/****** Object:  Table [dbo].[detalles_equipos]    Script Date: 10/03/2025 21:25:34 ******/
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
/****** Object:  Table [dbo].[empleados]    Script Date: 10/03/2025 21:25:34 ******/
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
/****** Object:  Table [dbo].[equipos]    Script Date: 10/03/2025 21:25:34 ******/
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
/****** Object:  Table [dbo].[pagos]    Script Date: 10/03/2025 21:25:34 ******/
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
/****** Object:  Table [dbo].[profesiones]    Script Date: 10/03/2025 21:25:34 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[proyectos]    Script Date: 10/03/2025 21:25:34 ******/
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
SET IDENTITY_INSERT [dbo].[clientes] ON 

INSERT [dbo].[clientes] ([id], [codigo], [nombre], [sector], [pais], [email], [telefono], [identificador_cliente], [direccion], [web_url], [tipo]) VALUES (1, N'PE20250001', N'BBVA', N'FINANCIERO', N'Perú', N'bbva@bbva.com', N'01 123546', N'20635632145', N'San Isidro', N'bbva.com', N'Empresa Grande')
INSERT [dbo].[clientes] ([id], [codigo], [nombre], [sector], [pais], [email], [telefono], [identificador_cliente], [direccion], [web_url], [tipo]) VALUES (122, N'0001JK', N'JKC Tecnología e Información', N'TECH', N'PERÚ', N'tecnojkcit@gmail.com', N'32165894', N'12345678910', N'Huaraz-Ancash', N'www.jkctecnologiaeinformacion.com', NULL)
INSERT [dbo].[clientes] ([id], [codigo], [nombre], [sector], [pais], [email], [telefono], [identificador_cliente], [direccion], [web_url], [tipo]) VALUES (123, N'0002EM', N'Empresa Alpha S.A.', N'TECH', N'PERÚ', N'resa_aemp@gmail.com', N'1857687', N'20100000001', N'AV. Industrial 123', N'www.empresaalphasa.com', NULL)
INSERT [dbo].[clientes] ([id], [codigo], [nombre], [sector], [pais], [email], [telefono], [identificador_cliente], [direccion], [web_url], [tipo]) VALUES (124, N'0003BE', N'Beta Corp.', N'TECH', N'PERÚ', N'a_corpbet@gmail.com', N'1857687', N'20100000002', N'Calle Comercio 456', N'www.betacorp.com', NULL)
INSERT [dbo].[clientes] ([id], [codigo], [nombre], [sector], [pais], [email], [telefono], [identificador_cliente], [direccion], [web_url], [tipo]) VALUES (125, N'0004GA', N'Gamma S.R.L.', N'TECH', N'PERÚ', N'ma_s.rgam@gmail.com', N'1857687', N'20100000003', N'Av. Producción 789', N'www.gammasrl.com', NULL)
INSERT [dbo].[clientes] ([id], [codigo], [nombre], [sector], [pais], [email], [telefono], [identificador_cliente], [direccion], [web_url], [tipo]) VALUES (126, N'0005DE', N'Delta y Asociados', N'TECH', N'PERÚ', N'ta_y_adel@gmail.com', N'1857687', N'20100000004', N'Calle Negocios 101', N'www.deltayasociados.com', NULL)
INSERT [dbo].[clientes] ([id], [codigo], [nombre], [sector], [pais], [email], [telefono], [identificador_cliente], [direccion], [web_url], [tipo]) VALUES (127, N'0006EP', N'Epsilon Ltda.', N'TECH', N'PERÚ', N'ilon_leps@gmail.com', N'1857687', N'20100000005', N'Av. Servicios 202', N'www.epsilonltda.com', NULL)
INSERT [dbo].[clientes] ([id], [codigo], [nombre], [sector], [pais], [email], [telefono], [identificador_cliente], [direccion], [web_url], [tipo]) VALUES (128, N'0007ZE', N'Zeta Consultores', N'TECH', N'PERÚ', N'a_conszet@gmail.com', N'1857687', N'20100000006', N'Calle Soluciones 303', N'www.zetaconsultores.com', NULL)
INSERT [dbo].[clientes] ([id], [codigo], [nombre], [sector], [pais], [email], [telefono], [identificador_cliente], [direccion], [web_url], [tipo]) VALUES (129, N'0008TH', N'Theta Innovaciones', N'TECH', N'PERÚ', N'ta_innthe@gmail.com', N'1857687', N'20100000007', N'Av. Proyectos 404', N'www.thetainnovaciones.com', NULL)
INSERT [dbo].[clientes] ([id], [codigo], [nombre], [sector], [pais], [email], [telefono], [identificador_cliente], [direccion], [web_url], [tipo]) VALUES (130, N'0009IO', N'Iota Ingeniería S.A.C.', N'TECH', N'PERÚ', N'a_ingeiot@gmail.com', N'1857687', N'20100000008', N'Calle Desarrollo 505', N'www.iotaingenieriasac.com', NULL)
INSERT [dbo].[clientes] ([id], [codigo], [nombre], [sector], [pais], [email], [telefono], [identificador_cliente], [direccion], [web_url], [tipo]) VALUES (131, N'00010KA', N'Kappa Tecnología', N'TECH', N'PERÚ', N'pa_teckap@gmail.com', N'1857687', N'20100000009', N'Av. Avances 606', N'www.kappatecnologia.com', NULL)
INSERT [dbo].[clientes] ([id], [codigo], [nombre], [sector], [pais], [email], [telefono], [identificador_cliente], [direccion], [web_url], [tipo]) VALUES (132, N'00011LA', N'Lambda Construcciones', N'TECH', N'PERÚ', N'bda_colam@gmail.com', N'1857687', N'20100000010', N'Calle Obras 707', N'www.lambdaconstrucciones.com', NULL)
INSERT [dbo].[clientes] ([id], [codigo], [nombre], [sector], [pais], [email], [telefono], [identificador_cliente], [direccion], [web_url], [tipo]) VALUES (133, N'00012MU', N'Mu Financiera', N'TECH', N'PERÚ', N'financmu_@gmail.com', N'1857687', N'20100000011', N'Av. Capital 808', N'www.mufinanciera.com', NULL)
INSERT [dbo].[clientes] ([id], [codigo], [nombre], [sector], [pais], [email], [telefono], [identificador_cliente], [direccion], [web_url], [tipo]) VALUES (134, N'00013NU', N'Nu Servicios S.A.', N'TECH', N'PERÚ', N'servicnu_@gmail.com', N'1857687', N'20100000012', N'Calle Asesoría 909', N'www.nuserviciossa.com', NULL)
INSERT [dbo].[clientes] ([id], [codigo], [nombre], [sector], [pais], [email], [telefono], [identificador_cliente], [direccion], [web_url], [tipo]) VALUES (135, N'00014XI', N'Xi Consultoría', N'TECH', N'PERÚ', N'consulxi_@gmail.com', N'1857687', N'20100000013', N'Av. Estrategia 1010', N'www.xiconsultoria.com', NULL)
INSERT [dbo].[clientes] ([id], [codigo], [nombre], [sector], [pais], [email], [telefono], [identificador_cliente], [direccion], [web_url], [tipo]) VALUES (136, N'00015OM', N'Omicron Logística', N'TECH', N'PERÚ', N'cron_lomi@gmail.com', N'1857687', N'20100000014', N'Calle Distribución 1111', N'www.omicronlogistica.com', NULL)
INSERT [dbo].[clientes] ([id], [codigo], [nombre], [sector], [pais], [email], [telefono], [identificador_cliente], [direccion], [web_url], [tipo]) VALUES (137, N'00016PI', N'Pi Internacional', N'TECH', N'PERÚ', N'internpi_@gmail.com', N'1857687', N'20100000015', N'Av. Comercio Exterior 1212', N'www.piinternacional.com', NULL)
INSERT [dbo].[clientes] ([id], [codigo], [nombre], [sector], [pais], [email], [telefono], [identificador_cliente], [direccion], [web_url], [tipo]) VALUES (138, N'00017RH', N'Rho Exportaciones', N'TECH', N'PERÚ', N'exporrho@gmail.com', N'1857687', N'20100000016', N'Calle Global 1313', N'www.rhoexportaciones.com', NULL)
INSERT [dbo].[clientes] ([id], [codigo], [nombre], [sector], [pais], [email], [telefono], [identificador_cliente], [direccion], [web_url], [tipo]) VALUES (139, N'00018SI', N'Sigma Importaciones', N'TECH', N'PERÚ', N'ma_impsig@gmail.com', N'1857687', N'20100000017', N'Av. Importadores 1414', N'www.sigmaimportaciones.com', NULL)
INSERT [dbo].[clientes] ([id], [codigo], [nombre], [sector], [pais], [email], [telefono], [identificador_cliente], [direccion], [web_url], [tipo]) VALUES (140, N'00019TA', N'Tau Energía S.A.', N'TECH', N'PERÚ', N'energtau@gmail.com', N'1857687', N'20100000018', N'Calle Recursos 1515', N'www.tauenergiasa.com', NULL)
INSERT [dbo].[clientes] ([id], [codigo], [nombre], [sector], [pais], [email], [telefono], [identificador_cliente], [direccion], [web_url], [tipo]) VALUES (141, N'00020UP', N'Upsilon Tecnológica', N'TECH', N'PERÚ', N'ilon_tups@gmail.com', N'1857687', N'20100000019', N'Av. Innovación 1616', N'www.upsilontecnologica.com', NULL)
INSERT [dbo].[clientes] ([id], [codigo], [nombre], [sector], [pais], [email], [telefono], [identificador_cliente], [direccion], [web_url], [tipo]) VALUES (142, N'00021PH', N'Phi Construcciones', N'TECH', N'PERÚ', N'constphi@gmail.com', N'1857687', N'20100000020', N'Calle Edificaciones 1717', N'www.phiconstrucciones.com', NULL)
INSERT [dbo].[clientes] ([id], [codigo], [nombre], [sector], [pais], [email], [telefono], [identificador_cliente], [direccion], [web_url], [tipo]) VALUES (143, N'00022CH', N'Chi Industrial', N'TECH', N'PERÚ', N'induschi@gmail.com', N'1857687', N'20100000021', N'Av. Manufactura 1818', N'www.chiindustrial.com', NULL)
INSERT [dbo].[clientes] ([id], [codigo], [nombre], [sector], [pais], [email], [telefono], [identificador_cliente], [direccion], [web_url], [tipo]) VALUES (144, N'00023PS', N'Psi Consultores', N'TECH', N'PERÚ', N'consupsi@gmail.com', N'1857687', N'20100000022', N'Calle Planeación 1919', N'www.psiconsultores.com', NULL)
INSERT [dbo].[clientes] ([id], [codigo], [nombre], [sector], [pais], [email], [telefono], [identificador_cliente], [direccion], [web_url], [tipo]) VALUES (145, N'00024OM', N'Omega Global S.A.C.', N'TECH', N'PERÚ', N'ga_gloome@gmail.com', N'1857687', N'20100000023', N'Av. Internacional 2020', N'www.omegaglobalsac.com', NULL)
INSERT [dbo].[clientes] ([id], [codigo], [nombre], [sector], [pais], [email], [telefono], [identificador_cliente], [direccion], [web_url], [tipo]) VALUES (146, N'00025AL', N'Alpha Soluciones', N'TECH', N'PERÚ', N'ha_solalp@gmail.com', N'1857687', N'20100000024', N'Calle Innovación 2121', N'www.alphasoluciones.com', NULL)
INSERT [dbo].[clientes] ([id], [codigo], [nombre], [sector], [pais], [email], [telefono], [identificador_cliente], [direccion], [web_url], [tipo]) VALUES (147, N'00026BE', N'Beta Tech', N'TECH', N'PERÚ', N'a_techbet@gmail.com', N'1857687', N'20100000025', N'Av. Tecnología 2222', N'www.betatech.com', NULL)
INSERT [dbo].[clientes] ([id], [codigo], [nombre], [sector], [pais], [email], [telefono], [identificador_cliente], [direccion], [web_url], [tipo]) VALUES (148, N'00027GA', N'Gamma Logística', N'TECH', N'PERÚ', N'ma_loggam@gmail.com', N'1857687', N'20100000026', N'Calle Distribución 2323', N'www.gammalogistica.com', NULL)
INSERT [dbo].[clientes] ([id], [codigo], [nombre], [sector], [pais], [email], [telefono], [identificador_cliente], [direccion], [web_url], [tipo]) VALUES (149, N'00028DE', N'Delta Asesoría', N'TECH', N'PERÚ', N'ta_asedel@gmail.com', N'1857687', N'20100000027', N'Av. Negocios 2424', N'www.deltaasesoria.com', NULL)
INSERT [dbo].[clientes] ([id], [codigo], [nombre], [sector], [pais], [email], [telefono], [identificador_cliente], [direccion], [web_url], [tipo]) VALUES (150, N'00029EP', N'Epsilon Innovación', N'TECH', N'PERÚ', N'ilon_ieps@gmail.com', N'1857687', N'20100000028', N'Calle Futuro 2525', N'www.epsiloninnovacion.com', NULL)
INSERT [dbo].[clientes] ([id], [codigo], [nombre], [sector], [pais], [email], [telefono], [identificador_cliente], [direccion], [web_url], [tipo]) VALUES (151, N'00030ZE', N'Zeta Proyectos', N'TECH', N'PERÚ', N'a_proyzet@gmail.com', N'1857687', N'20100000029', N'Av. Emprendedores 2626', N'www.zetaproyectos.com', NULL)
SET IDENTITY_INSERT [dbo].[clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[cuotas] ON 

INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (1, 3, 1, 64000.0000, CAST(N'2024-02-10T00:00:00.000' AS DateTime), CAST(N'2024-02-10T00:00:00.000' AS DateTime), N'pagado', CAST(0.00 AS Decimal(9, 2)), 1280)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (2, 3, 2, 64000.0000, CAST(N'2024-03-10T00:00:00.000' AS DateTime), CAST(N'2024-03-10T00:00:00.000' AS DateTime), N'pagado', CAST(0.00 AS Decimal(9, 2)), 1280)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (3, 3, 3, 64000.0000, CAST(N'2024-04-10T00:00:00.000' AS DateTime), CAST(N'2024-04-10T00:00:00.000' AS DateTime), N'pagado', CAST(0.00 AS Decimal(9, 2)), 1280)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (4, 3, 4, 64000.0000, CAST(N'2024-05-10T00:00:00.000' AS DateTime), CAST(N'2024-05-10T00:00:00.000' AS DateTime), N'pagado', CAST(0.00 AS Decimal(9, 2)), 1280)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (5, 3, 5, 64000.0000, CAST(N'2024-06-10T00:00:00.000' AS DateTime), CAST(N'2024-06-10T00:00:00.000' AS DateTime), N'pagado', CAST(0.00 AS Decimal(9, 2)), 1280)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (12, 4, 1, 48000.0000, CAST(N'2024-03-01T00:00:00.000' AS DateTime), CAST(N'2024-09-15T00:00:00.000' AS DateTime), N'creado', CAST(0.00 AS Decimal(9, 2)), 960)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (13, 4, 2, 48000.0000, CAST(N'2024-04-01T00:00:00.000' AS DateTime), CAST(N'2024-10-15T00:00:00.000' AS DateTime), N'creado', CAST(0.00 AS Decimal(9, 2)), 960)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (14, 4, 3, 48000.0000, CAST(N'2024-05-01T00:00:00.000' AS DateTime), CAST(N'2024-11-15T00:00:00.000' AS DateTime), N'creado', CAST(0.00 AS Decimal(9, 2)), 960)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (15, 4, 4, 48000.0000, CAST(N'2024-06-01T00:00:00.000' AS DateTime), CAST(N'2024-12-15T00:00:00.000' AS DateTime), N'creado', CAST(0.00 AS Decimal(9, 2)), 960)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (16, 4, 5, 48000.0000, CAST(N'2024-07-01T00:00:00.000' AS DateTime), CAST(N'2025-01-15T00:00:00.000' AS DateTime), N'creado', CAST(0.00 AS Decimal(9, 2)), 960)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (17, 4, 6, 48000.0000, CAST(N'2024-08-01T00:00:00.000' AS DateTime), CAST(N'2025-02-15T00:00:00.000' AS DateTime), N'creado', CAST(0.00 AS Decimal(9, 2)), 960)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (18, 5, 1, 64000.0000, CAST(N'2024-04-05T00:00:00.000' AS DateTime), CAST(N'2024-10-30T00:00:00.000' AS DateTime), N'creado', CAST(0.00 AS Decimal(9, 2)), 1280)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (19, 5, 2, 64000.0000, CAST(N'2024-05-05T00:00:00.000' AS DateTime), CAST(N'2024-11-30T00:00:00.000' AS DateTime), N'creado', CAST(0.00 AS Decimal(9, 2)), 1280)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (20, 5, 3, 64000.0000, CAST(N'2024-06-05T00:00:00.000' AS DateTime), CAST(N'2024-12-30T00:00:00.000' AS DateTime), N'creado', CAST(0.00 AS Decimal(9, 2)), 1280)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (21, 5, 4, 64000.0000, CAST(N'2024-07-05T00:00:00.000' AS DateTime), CAST(N'2025-01-30T00:00:00.000' AS DateTime), N'creado', CAST(0.00 AS Decimal(9, 2)), 1280)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (22, 5, 5, 64000.0000, CAST(N'2024-08-05T00:00:00.000' AS DateTime), CAST(N'2025-02-28T00:00:00.000' AS DateTime), N'creado', CAST(0.00 AS Decimal(9, 2)), 1280)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (23, 5, 6, 64000.0000, CAST(N'2024-09-05T00:00:00.000' AS DateTime), CAST(N'2025-03-30T00:00:00.000' AS DateTime), N'creado', CAST(0.00 AS Decimal(9, 2)), 1280)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (24, 6, 1, 60000.0000, CAST(N'2024-05-01T00:00:00.000' AS DateTime), CAST(N'2025-01-20T00:00:00.000' AS DateTime), N'creado', CAST(0.00 AS Decimal(9, 2)), 1200)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (25, 6, 2, 60000.0000, CAST(N'2024-06-01T00:00:00.000' AS DateTime), CAST(N'2025-02-20T00:00:00.000' AS DateTime), N'creado', CAST(0.00 AS Decimal(9, 2)), 1200)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (26, 6, 3, 60000.0000, CAST(N'2024-07-01T00:00:00.000' AS DateTime), CAST(N'2025-03-20T00:00:00.000' AS DateTime), N'creado', CAST(0.00 AS Decimal(9, 2)), 1200)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (27, 6, 4, 60000.0000, CAST(N'2024-08-01T00:00:00.000' AS DateTime), CAST(N'2025-04-20T00:00:00.000' AS DateTime), N'creado', CAST(0.00 AS Decimal(9, 2)), 1200)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (28, 6, 5, 60000.0000, CAST(N'2024-09-01T00:00:00.000' AS DateTime), CAST(N'2025-05-20T00:00:00.000' AS DateTime), N'creado', CAST(0.00 AS Decimal(9, 2)), 1200)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (29, 6, 6, 60000.0000, CAST(N'2024-10-01T00:00:00.000' AS DateTime), CAST(N'2025-06-20T00:00:00.000' AS DateTime), N'creado', CAST(0.00 AS Decimal(9, 2)), 1200)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (30, 6, 7, 60000.0000, CAST(N'2024-11-01T00:00:00.000' AS DateTime), CAST(N'2025-07-20T00:00:00.000' AS DateTime), N'creado', CAST(0.00 AS Decimal(9, 2)), 1200)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (31, 6, 8, 60000.0000, CAST(N'2024-12-01T00:00:00.000' AS DateTime), CAST(N'2025-08-20T00:00:00.000' AS DateTime), N'creado', CAST(0.00 AS Decimal(9, 2)), 1200)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (32, 7, 1, 56000.0000, CAST(N'2024-06-15T00:00:00.000' AS DateTime), CAST(N'2024-12-15T00:00:00.000' AS DateTime), N'creado', CAST(0.00 AS Decimal(9, 2)), 1120)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (33, 7, 2, 56000.0000, CAST(N'2024-07-15T00:00:00.000' AS DateTime), CAST(N'2025-01-15T00:00:00.000' AS DateTime), N'creado', CAST(0.00 AS Decimal(9, 2)), 1120)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (34, 7, 3, 56000.0000, CAST(N'2024-08-15T00:00:00.000' AS DateTime), CAST(N'2025-02-15T00:00:00.000' AS DateTime), N'creado', CAST(0.00 AS Decimal(9, 2)), 1120)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (35, 7, 4, 56000.0000, CAST(N'2024-09-15T00:00:00.000' AS DateTime), CAST(N'2025-03-15T00:00:00.000' AS DateTime), N'creado', CAST(0.00 AS Decimal(9, 2)), 1120)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (36, 7, 5, 56000.0000, CAST(N'2024-10-15T00:00:00.000' AS DateTime), CAST(N'2025-04-15T00:00:00.000' AS DateTime), N'creado', CAST(0.00 AS Decimal(9, 2)), 1120)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (37, 7, 6, 56000.0000, CAST(N'2024-11-15T00:00:00.000' AS DateTime), CAST(N'2025-05-15T00:00:00.000' AS DateTime), N'creado', CAST(0.00 AS Decimal(9, 2)), 1120)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (38, 8, 1, 44000.0000, CAST(N'2024-07-10T00:00:00.000' AS DateTime), CAST(N'2025-01-31T00:00:00.000' AS DateTime), N'creado', CAST(0.00 AS Decimal(9, 2)), 880)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (39, 8, 2, 44000.0000, CAST(N'2024-08-10T00:00:00.000' AS DateTime), CAST(N'2025-02-28T00:00:00.000' AS DateTime), N'creado', CAST(0.00 AS Decimal(9, 2)), 880)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (40, 8, 3, 44000.0000, CAST(N'2024-09-10T00:00:00.000' AS DateTime), CAST(N'2025-03-31T00:00:00.000' AS DateTime), N'creado', CAST(0.00 AS Decimal(9, 2)), 880)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (41, 8, 4, 44000.0000, CAST(N'2024-10-10T00:00:00.000' AS DateTime), CAST(N'2025-04-30T00:00:00.000' AS DateTime), N'creado', CAST(0.00 AS Decimal(9, 2)), 880)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (42, 8, 5, 44000.0000, CAST(N'2024-11-10T00:00:00.000' AS DateTime), CAST(N'2025-05-31T00:00:00.000' AS DateTime), N'creado', CAST(0.00 AS Decimal(9, 2)), 880)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (43, 8, 6, 44000.0000, CAST(N'2024-12-10T00:00:00.000' AS DateTime), CAST(N'2025-06-30T00:00:00.000' AS DateTime), N'creado', CAST(0.00 AS Decimal(9, 2)), 880)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (44, 9, 1, 40000.0000, CAST(N'2024-08-20T00:00:00.000' AS DateTime), CAST(N'2025-02-20T00:00:00.000' AS DateTime), N'creado', CAST(0.00 AS Decimal(9, 2)), 800)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (45, 9, 2, 40000.0000, CAST(N'2024-09-20T00:00:00.000' AS DateTime), CAST(N'2025-03-20T00:00:00.000' AS DateTime), N'creado', CAST(0.00 AS Decimal(9, 2)), 800)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (46, 9, 3, 40000.0000, CAST(N'2024-10-20T00:00:00.000' AS DateTime), CAST(N'2025-04-20T00:00:00.000' AS DateTime), N'creado', CAST(0.00 AS Decimal(9, 2)), 800)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (47, 9, 4, 40000.0000, CAST(N'2024-11-20T00:00:00.000' AS DateTime), CAST(N'2025-05-20T00:00:00.000' AS DateTime), N'creado', CAST(0.00 AS Decimal(9, 2)), 800)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (48, 9, 5, 40000.0000, CAST(N'2024-12-20T00:00:00.000' AS DateTime), CAST(N'2025-06-20T00:00:00.000' AS DateTime), N'creado', CAST(0.00 AS Decimal(9, 2)), 800)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (49, 9, 6, 40000.0000, CAST(N'2025-01-20T00:00:00.000' AS DateTime), CAST(N'2025-07-20T00:00:00.000' AS DateTime), N'creado', CAST(0.00 AS Decimal(9, 2)), 800)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (50, 10, 1, 64000.0000, CAST(N'2024-09-05T00:00:00.000' AS DateTime), CAST(N'2025-03-28T00:00:00.000' AS DateTime), N'creado', CAST(0.00 AS Decimal(9, 2)), 1280)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (51, 10, 2, 64000.0000, CAST(N'2024-10-05T00:00:00.000' AS DateTime), CAST(N'2025-04-28T00:00:00.000' AS DateTime), N'creado', CAST(0.00 AS Decimal(9, 2)), 1280)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (52, 10, 3, 64000.0000, CAST(N'2024-11-05T00:00:00.000' AS DateTime), CAST(N'2025-05-28T00:00:00.000' AS DateTime), N'creado', CAST(0.00 AS Decimal(9, 2)), 1280)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (53, 10, 4, 64000.0000, CAST(N'2024-12-05T00:00:00.000' AS DateTime), CAST(N'2025-06-28T00:00:00.000' AS DateTime), N'creado', CAST(0.00 AS Decimal(9, 2)), 1280)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (54, 10, 5, 64000.0000, CAST(N'2025-01-05T00:00:00.000' AS DateTime), CAST(N'2025-07-28T00:00:00.000' AS DateTime), N'creado', CAST(0.00 AS Decimal(9, 2)), 1280)
INSERT [dbo].[cuotas] ([id], [proyecto_id], [numero_cuota], [monto_cuota], [fecha_pago], [fecha_vencimiento], [estado], [penalidad], [horas_facturadas]) VALUES (55, 10, 6, 64000.0000, CAST(N'2025-02-05T00:00:00.000' AS DateTime), CAST(N'2025-08-28T00:00:00.000' AS DateTime), N'creado', CAST(0.00 AS Decimal(9, 2)), 1280)
SET IDENTITY_INSERT [dbo].[cuotas] OFF
GO
SET IDENTITY_INSERT [dbo].[detalles_equipos] ON 

INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (1, 2, 53, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.383' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (2, 2, 26, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.390' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (3, 2, 56, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.390' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (4, 3, 59, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.390' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (5, 3, 8, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.390' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (6, 3, 43, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.390' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (7, 3, 14, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.390' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (8, 4, 48, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.390' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (9, 4, 54, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.390' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (10, 4, 52, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.393' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (11, 4, 9, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.393' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (12, 4, 11, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.393' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (13, 5, 55, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.393' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (14, 5, 44, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.393' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (15, 5, 55, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.393' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (16, 5, 43, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.393' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (17, 5, 32, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.397' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (18, 6, 50, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.397' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (19, 6, 21, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.397' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (20, 6, 5, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.397' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (21, 7, 33, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.397' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (22, 7, 66, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.397' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (23, 7, 34, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.397' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (24, 7, 22, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.397' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (25, 8, 20, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.397' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (26, 8, 45, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.397' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (27, 8, 1, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.400' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (28, 8, 2, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.400' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (29, 9, 34, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.400' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (30, 9, 23, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.400' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (31, 9, 33, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.400' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (32, 10, 14, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.400' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (33, 10, 12, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.400' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (34, 10, 27, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.400' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (35, 11, 38, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.400' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (36, 11, 51, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.400' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (37, 11, 28, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.403' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (38, 11, 53, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.403' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (39, 12, 38, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.403' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (40, 12, 66, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.403' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (41, 12, 3, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.403' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (42, 12, 32, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.403' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (43, 12, 57, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.403' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (44, 13, 20, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.403' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (45, 13, 27, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.407' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (46, 13, 58, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.407' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (47, 13, 39, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.407' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (48, 14, 61, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.407' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (49, 14, 39, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.407' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (50, 14, 64, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.407' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (51, 15, 19, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.407' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (52, 15, 6, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.407' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (53, 15, 60, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.407' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (54, 15, 42, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.407' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (55, 16, 68, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.410' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (56, 16, 5, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.410' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (57, 16, 65, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.410' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (58, 16, 25, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.410' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (59, 16, 47, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.410' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (60, 17, 52, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.410' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (61, 17, 15, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.410' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (62, 17, 42, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.410' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (63, 18, 37, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.410' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (64, 18, 12, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.410' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (65, 18, 23, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.413' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (66, 19, 67, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.413' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (67, 19, 29, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.413' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (68, 19, 6, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.413' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (69, 20, 2, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.413' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (70, 20, 4, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.413' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (71, 20, 19, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.413' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (72, 20, 4, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.413' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (73, 21, 56, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.413' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (74, 21, 37, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.417' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (75, 21, 59, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.417' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (76, 21, 30, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.417' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (77, 21, 17, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.417' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (78, 22, 36, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.417' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (79, 22, 68, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.417' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (80, 22, 11, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:36:23.417' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (81, 2, 23, CAST(0.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.763' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (82, 2, 97, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.767' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (83, 2, 49, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.767' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (84, 2, 3, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.767' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (85, 2, 100, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.767' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (86, 3, 33, CAST(0.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.767' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (87, 3, 94, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.767' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (88, 3, 80, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.767' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (89, 3, 89, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.770' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (90, 3, 109, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.770' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (91, 4, 32, CAST(0.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.770' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (92, 4, 70, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.770' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (93, 4, 27, CAST(0.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.770' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (94, 5, 46, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.770' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (95, 5, 33, CAST(0.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.770' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (96, 5, 7, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.770' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (97, 5, 113, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.770' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (98, 5, 3, CAST(0.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.770' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (99, 6, 73, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.770' AS DateTime), NULL)
GO
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (100, 6, 110, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.770' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (101, 6, 112, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.773' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (102, 6, 30, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.773' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (103, 6, 15, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.773' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (104, 7, 67, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.773' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (105, 7, 61, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.773' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (106, 7, 79, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.773' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (107, 7, 35, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.773' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (108, 7, 10, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.773' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (109, 8, 65, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.773' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (110, 8, 18, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.773' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (111, 8, 61, CAST(0.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.777' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (112, 8, 10, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.777' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (113, 8, 30, CAST(0.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.777' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (114, 9, 11, CAST(0.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.777' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (115, 9, 92, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.777' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (116, 9, 82, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.777' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (117, 9, 6, CAST(0.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.777' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (118, 10, 115, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.780' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (119, 10, 108, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.780' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (120, 10, 99, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.780' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (121, 10, 115, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.780' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (122, 10, 53, CAST(0.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.780' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (123, 11, 37, CAST(0.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.780' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (124, 11, 26, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.780' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (125, 11, 93, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.780' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (126, 11, 93, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.780' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (127, 12, 64, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.780' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (128, 12, 40, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.780' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (129, 12, 110, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.783' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (130, 12, 17, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.783' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (131, 13, 15, CAST(0.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.783' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (132, 13, 113, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.783' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (133, 13, 91, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.783' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (134, 13, 73, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.783' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (135, 13, 112, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.783' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (136, 14, 53, CAST(0.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.783' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (137, 14, 45, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.783' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (138, 14, 24, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.787' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (139, 14, 92, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.787' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (140, 14, 81, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.787' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (141, 15, 81, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.787' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (142, 15, 108, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.787' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (143, 15, 103, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.787' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (144, 15, 6, CAST(0.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.787' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (145, 16, 47, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.787' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (146, 16, 43, CAST(0.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.787' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (147, 16, 99, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.787' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (148, 16, 37, CAST(0.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.790' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (149, 16, 27, CAST(0.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.790' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (150, 17, 43, CAST(0.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.790' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (151, 17, 80, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.790' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (152, 17, 86, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.790' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (153, 18, 114, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.790' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (154, 18, 106, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.790' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (155, 18, 5, CAST(0.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.790' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (156, 18, 57, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.790' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (157, 19, 11, CAST(0.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.790' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (158, 19, 63, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.790' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (159, 19, 23, CAST(0.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.790' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (160, 19, 4, CAST(0.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.790' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (161, 19, 14, CAST(0.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.793' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (162, 20, 47, CAST(0.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.793' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (163, 20, 70, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.793' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (164, 20, 71, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.793' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (165, 21, 65, CAST(0.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.793' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (166, 21, 66, CAST(0.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.793' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (167, 21, 111, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.793' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (168, 21, 62, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.793' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (169, 21, 103, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.793' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (170, 22, 75, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.797' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (171, 22, 25, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.797' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (172, 22, 50, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.797' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (173, 22, 1, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.797' AS DateTime), NULL)
INSERT [dbo].[detalles_equipos] ([id], [equipo_id], [empleado_id], [horas_asignadas], [rol], [fecha_asignacion], [fecha_termino_asignacion]) VALUES (174, 22, 100, CAST(4.00 AS Decimal(9, 2)), N'Miembro del equipo', CAST(N'2025-03-10T19:51:23.797' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[detalles_equipos] OFF
GO
SET IDENTITY_INSERT [dbo].[empleados] ON 

INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (1, 4, N'Kevin', N'Rivera', N'12345670', N'kevinriveravergaray@gmail.com', N'kriverav@dsrp.com', N'918839228', CAST(N'2025-03-03' AS Date), CAST(N'2026-03-03' AS Date), N'Vergaray')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (2, 3, N'Carlos', N'Tong', N'12345078', N'carlostong@gmail.com', N'ctong@dsrp.com', N'911234528', CAST(N'2025-03-03' AS Date), CAST(N'2026-03-03' AS Date), NULL)
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (3, 21, N'Andrea', N'Mendoza', N'67890135', N'andrea.mendoza@example.com', N'AMendozaR@dsrp.com', N'987654370', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Rojas')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (4, 5, N'Miguel', N'Castro', N'78901246', N'miguel.castro@example.com', N'MCastroV@dsrp.com', N'987654371', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Vega')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (5, 4, N'Lorena', N'Vargas', N'89012357', N'lorena.vargas@example.com', N'LVargasR@dsrp.com', N'987654372', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Ramírez')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (6, 13, N'Diego', N'Morales', N'90123468', N'diego.morales@example.com', N'DMoralesT@dsrp.com', N'987654373', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Torres')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (7, 9, N'Cecilia', N'Ramos', N'12334579', N'cecilia.ramos@example.com', N'CRamosP@dsrp.com', N'987654374', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Pérez')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (8, 17, N'Jorge', N'Figueroa', N'23445690', N'jorge.figueroa@example.com', N'JFigueroaG@dsrp.com', N'987654375', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Gómez')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (9, 19, N'Santiago', N'Delgado', N'34556791', N'santiago.delgado@example.com', N'SDelgadoL@dsrp.com', N'987654376', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'López')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (10, 10, N'Paula', N'Silva', N'45667892', N'paula.silva@example.com', N'PSilvaF@dsrp.com', N'987654377', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Fernández')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (11, 6, N'Natalia', N'Rivera', N'56778903', N'natalia.rivera@example.com', N'NRiveraM@dsrp.com', N'987654378', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Martínez')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (12, 12, N'Fabio', N'Paredes', N'67889024', N'fabio.paredes@example.com', N'FParedesS@dsrp.com', N'987654379', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Suárez')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (13, 16, N'Adriana', N'Villanueva', N'67900136', N'adriana.villanueva@example.com', N'AVillanuevaC@dsrp.com', N'987654380', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Cruz')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (14, 7, N'Luis', N'Soto', N'78911247', N'luis.soto@example.com', N'LSotoC@dsrp.com', N'987654381', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Carvajal')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (15, 11, N'Verónica', N'López', N'89021358', N'veronica.lopez@example.com', N'VLópezC@dsrp.com', N'987654382', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Chávez')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (16, 22, N'Julio', N'Reyes', N'90131469', N'julio.reyes@example.com', N'JReyesH@dsrp.com', N'987654383', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Hernández')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (17, 8, N'Elena', N'Gómez', N'12344580', N'elena.gomez@example.com', N'EGómezT@dsrp.com', N'987654384', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Torres')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (18, 3, N'Renato', N'Herrera', N'23455691', N'renato.herrera@example.com', N'RHerreraQ@dsrp.com', N'987654385', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Quispe')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (19, 18, N'Marcela', N'Chávez', N'34566792', N'marcela.chavez@example.com', N'MChávezR@dsrp.com', N'987654386', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Ramos')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (20, 14, N'Carlos', N'Salazar', N'45677893', N'carlos.salazar@example.com', N'CSalazarL@dsrp.com', N'987654387', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'López')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (21, 15, N'Daniela', N'Medina', N'56788904', N'daniela.medina@example.com', N'DMedinaC@dsrp.com', N'987654388', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Cordero')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (22, 21, N'Oscar', N'Alarcón', N'67899025', N'oscar.alarcon@example.com', N'OAlarcónJ@dsrp.com', N'987654389', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Jiménez')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (23, 5, N'María', N'Ponce', N'67910136', N'maria.ponce@example.com', N'MPonceV@dsrp.com', N'987654390', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Valverde')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (24, 4, N'Fabián', N'Núñez', N'78921247', N'fabian.nunez@example.com', N'FNúñezA@dsrp.com', N'987654391', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Arias')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (25, 13, N'Rocío', N'Campos', N'89031358', N'rocio.campos@example.com', N'RCamposL@dsrp.com', N'987654392', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Luna')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (26, 9, N'Héctor', N'Peña', N'90141469', N'hector.pena@example.com', N'HPeñaG@dsrp.com', N'987654393', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Guzmán')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (27, 17, N'Ana', N'Benavides', N'12354580', N'ana.benavides@example.com', N'ABenavidesF@dsrp.com', N'987654394', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Fuentes')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (28, 19, N'Mauricio', N'Ibáñez', N'23465691', N'mauricio.ibanez@example.com', N'MIbáñezZ@dsrp.com', N'987654395', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Zeballos')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (29, 10, N'Luciana', N'Zambrano', N'34576792', N'luciana.zambrano@example.com', N'LZambranoM@dsrp.com', N'987654396', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Mendoza')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (30, 6, N'Natalie', N'Ávila', N'56798904', N'natalie.avila@example.com', N'NÁvilaP@dsrp.com', N'987654398', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Paredes')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (31, 12, N'Fernando', N'Zavala', N'67809025', N'fernando.zavala@example.com', N'FZavalaA@dsrp.com', N'987654399', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Arce')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (32, 16, N'Mónica', N'Paredes', N'67920136', N'monica.paredes@example.com', N'MParedesR@dsrp.com', N'987654400', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Ríos')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (33, 7, N'Esteban', N'Córdova', N'78931247', N'esteban.cordova@example.com', N'ECórdovaV@dsrp.com', N'987654401', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Villalobos')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (34, 11, N'Patricia', N'Vega', N'89041358', N'patricia.vega@example.com', N'PVegaM@dsrp.com', N'987654402', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Maldonado')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (35, 22, N'Joaquín', N'Quinteros', N'90151469', N'joaquin.quinteros@example.com', N'JQuinterosE@dsrp.com', N'987654403', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Espinoza')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (36, 8, N'Diana', N'Barrios', N'12364580', N'diana.barrios@example.com', N'DBarriosS@dsrp.com', N'987654404', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Silva')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (37, 3, N'Ricardo', N'Carranza', N'23475691', N'ricardo.carranza@example.com', N'RCarranzaV@dsrp.com', N'987654405', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Vargas')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (38, 18, N'Paola', N'Rosas', N'34586792', N'paola.rosas@example.com', N'PRosasP@dsrp.com', N'987654406', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Ponce')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (39, 14, N'Andrés', N'Valencia', N'45697893', N'andres.valencia@example.com', N'AValenciaM@dsrp.com', N'987654407', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Morales')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (40, 15, N'Victoria', N'Rivas', N'56708904', N'victoria.rivas@example.com', N'VRivasG@dsrp.com', N'987654408', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'García')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (41, 21, N'Emilio', N'Tello', N'67819025', N'emilio.tello@example.com', N'ETelloR@dsrp.com', N'987654409', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Romero')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (42, 5, N'Adriana', N'Villanueva', N'67900136', N'adriana.villanueva@example.com', N'AVillanuevaC@dsrp.com', N'987654380', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Cruz')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (43, 4, N'Luis', N'Soto', N'78911247', N'luis.soto@example.com', N'LSotoC@dsrp.com', N'987654381', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Carvajal')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (44, 13, N'Verónica', N'López', N'89021358', N'veronica.lopez@example.com', N'VLópezC@dsrp.com', N'987654382', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Chávez')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (45, 9, N'Julio', N'Reyes', N'90131469', N'julio.reyes@example.com', N'JReyesH@dsrp.com', N'987654383', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Hernández')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (46, 17, N'Elena', N'Gómez', N'12344580', N'elena.gomez@example.com', N'EGómezT@dsrp.com', N'987654384', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Torres')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (47, 19, N'Renato', N'Herrera', N'23455691', N'renato.herrera@example.com', N'RHerreraQ@dsrp.com', N'987654385', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Quispe')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (48, 10, N'Marcela', N'Chávez', N'34566792', N'marcela.chavez@example.com', N'MChávezR@dsrp.com', N'987654386', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Ramos')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (49, 6, N'Carlos', N'Salazar', N'45677893', N'carlos.salazar@example.com', N'CSalazarL@dsrp.com', N'987654387', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'López')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (50, 12, N'Daniela', N'Medina', N'56788904', N'daniela.medina@example.com', N'DMedinaC@dsrp.com', N'987654388', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Cordero')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (51, 16, N'María', N'Ponce', N'67910136', N'maria.ponce@example.com', N'MPonceV@dsrp.com', N'987654390', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Valverde')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (52, 7, N'Fabián', N'Núñez', N'78921247', N'fabian.nunez@example.com', N'FNúñezA@dsrp.com', N'987654391', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Arias')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (53, 11, N'Rocío', N'Campos', N'89031358', N'rocio.campos@example.com', N'RCamposL@dsrp.com', N'987654392', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Luna')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (54, 22, N'Héctor', N'Peña', N'90141469', N'hector.pena@example.com', N'HPeñaG@dsrp.com', N'987654393', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Guzmán')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (55, 8, N'Ana', N'Benavides', N'12354580', N'ana.benavides@example.com', N'ABenavidesF@dsrp.com', N'987654394', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Fuentes')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (56, 3, N'Mauricio', N'Ibáñez', N'23465691', N'mauricio.ibanez@example.com', N'MIbáñezZ@dsrp.com', N'987654395', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Zeballos')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (57, 18, N'Luciana', N'Zambrano', N'34576792', N'luciana.zambrano@example.com', N'LZambranoM@dsrp.com', N'987654396', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Mendoza')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (58, 14, N'Javier', N'Estrada', N'45687893', N'javier.estrada@example.com', N'JEstradaD@dsrp.com', N'987654397', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Durán')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (59, 15, N'Natalie', N'Ávila', N'56798904', N'natalie.avila@example.com', N'NÁvilaP@dsrp.com', N'987654398', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Paredes')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (60, 9, N'Fernando', N'Zavala', N'67809025', N'fernando.zavala@example.com', N'FZavalaA@dsrp.com', N'987654399', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Arce')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (61, 17, N'Mónica', N'Paredes', N'67920136', N'monica.paredes@example.com', N'MParedesR@dsrp.com', N'987654400', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Ríos')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (62, 19, N'Esteban', N'Córdova', N'78931247', N'esteban.cordova@example.com', N'ECórdovaV@dsrp.com', N'987654401', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Villalobos')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (63, 10, N'Patricia', N'Vega', N'89041358', N'patricia.vega@example.com', N'PVegaM@dsrp.com', N'987654402', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Maldonado')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (64, 6, N'Joaquín', N'Quinteros', N'90151469', N'joaquin.quinteros@example.com', N'JQuinterosE@dsrp.com', N'987654403', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Espinoza')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (65, 12, N'Diana', N'Barrios', N'12364580', N'diana.barrios@example.com', N'DBarriosS@dsrp.com', N'987654404', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Silva')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (66, 16, N'Paola', N'Rosas', N'34586792', N'paola.rosas@example.com', N'PRosasP@dsrp.com', N'987654406', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Ponce')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (67, 7, N'Andrés', N'Valencia', N'45697893', N'andres.valencia@example.com', N'AValenciaM@dsrp.com', N'987654407', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Morales')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (68, 11, N'Victoria', N'Rivas', N'56708904', N'victoria.rivas@example.com', N'VRivasG@dsrp.com', N'987654408', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'García')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (69, 9, N'Emilio', N'Tello', N'67819025', N'emilio.tello@example.com', N'ETelloR@dsrp.com', N'987654409', CAST(N'2025-03-07' AS Date), CAST(N'2033-03-07' AS Date), N'Romero')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (70, 3, N'Carlos', N'García', N'2.60364e+007', N'carlos.garcía@correo.com', NULL, NULL, CAST(N'2022-05-12' AS Date), CAST(N'2022-08-08' AS Date), N'Rojas')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (71, 4, N'María', N'López', N'8.42642e+007', N'maría.lópez@correo.com', NULL, NULL, CAST(N'2025-03-09' AS Date), CAST(N'2022-04-11' AS Date), N'Vargas')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (72, 5, N'Javier', N'Martínez', N'5.768e+007', N'javier.martínez@correo.com', NULL, NULL, CAST(N'2022-06-07' AS Date), CAST(N'2023-10-30' AS Date), N'Hernández')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (73, 6, N'Andrea', N'Pérez', N'8.13643e+007', N'andrea.pérez@correo.com', NULL, NULL, CAST(N'2020-07-15' AS Date), CAST(N'2023-02-02' AS Date), N'Morales')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (74, 7, N'Fernando', N'Sánchez', N'2.88075e+007', N'fernando.sánchez@correo.com', NULL, NULL, CAST(N'2020-05-08' AS Date), CAST(N'2023-10-10' AS Date), N'Castillo')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (75, 8, N'Sofía', N'Ramírez', N'2.98524e+007', N'sofía.ramírez@correo.com', NULL, NULL, CAST(N'2024-12-01' AS Date), CAST(N'2023-01-20' AS Date), N'Mendoza')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (76, 9, N'Alejandro', N'Torres', N'2.67216e+007', N'alejandro.torres@correo.com', NULL, NULL, CAST(N'2024-05-13' AS Date), CAST(N'2024-12-31' AS Date), N'Ortega')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (77, 10, N'Valeria', N'Flores', N'2.76866e+007', N'valeria.flores@correo.com', NULL, NULL, CAST(N'2022-11-01' AS Date), CAST(N'2024-07-23' AS Date), N'Cruz')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (78, 11, N'Ricardo', N'Gómez', N'2.78844e+007', N'ricardo.gómez@correo.com', NULL, NULL, CAST(N'2021-04-18' AS Date), CAST(N'2023-08-18' AS Date), N'Jiménez')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (79, 12, N'Lucía', N'Díaz', N'4.19305e+007', N'lucía.díaz@correo.com', NULL, NULL, CAST(N'2020-04-21' AS Date), CAST(N'2022-09-01' AS Date), N'Reyes')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (80, 13, N'Carlos', N'García', N'3.38896e+007', N'carlos.garcía@correo.com', NULL, NULL, CAST(N'2024-10-19' AS Date), CAST(N'2024-04-01' AS Date), N'Rojas')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (81, 14, N'María', N'López', N'3.80934e+007', N'maría.lópez@correo.com', NULL, NULL, CAST(N'2024-04-02' AS Date), CAST(N'2024-02-10' AS Date), N'Vargas')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (82, 15, N'Javier', N'Martínez', N'8.85301e+007', N'javier.martínez@correo.com', NULL, NULL, CAST(N'2021-07-23' AS Date), CAST(N'2024-12-23' AS Date), N'Hernández')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (83, 16, N'Andrea', N'Pérez', N'8.09883e+007', N'andrea.pérez@correo.com', NULL, NULL, CAST(N'2021-08-15' AS Date), CAST(N'2023-09-05' AS Date), N'Morales')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (84, 17, N'Fernando', N'Sánchez', N'8.80794e+007', N'fernando.sánchez@correo.com', NULL, NULL, CAST(N'2022-04-03' AS Date), CAST(N'2022-08-21' AS Date), N'Castillo')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (85, 18, N'Sofía', N'Ramírez', N'7.46462e+007', N'sofía.ramírez@correo.com', NULL, NULL, CAST(N'2023-10-12' AS Date), CAST(N'2022-03-26' AS Date), N'Mendoza')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (86, 19, N'Alejandro', N'Torres', N'9.24413e+007', N'alejandro.torres@correo.com', NULL, NULL, CAST(N'2023-05-26' AS Date), CAST(N'2022-08-27' AS Date), N'Ortega')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (88, 21, N'Ricardo', N'Gómez', N'3.46337e+007', N'ricardo.gómez@correo.com', NULL, NULL, CAST(N'2020-07-23' AS Date), CAST(N'2022-10-04' AS Date), N'Jiménez')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (89, 22, N'Lucía', N'Díaz', N'3.51604e+007', N'lucía.díaz@correo.com', NULL, NULL, CAST(N'2024-06-01' AS Date), CAST(N'2022-10-07' AS Date), N'Reyes')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (90, 3, N'Carlos', N'García', N'5.2361e+007', N'carlos.garcía@correo.com', NULL, NULL, CAST(N'2024-01-16' AS Date), CAST(N'2024-10-12' AS Date), N'Rojas')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (91, 4, N'María', N'López', N'7.55064e+007', N'maría.lópez@correo.com', NULL, NULL, CAST(N'2020-09-22' AS Date), CAST(N'2024-08-01' AS Date), N'Vargas')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (92, 5, N'Javier', N'Martínez', N'2.10513e+007', N'javier.martínez@correo.com', NULL, NULL, CAST(N'2023-02-07' AS Date), CAST(N'2023-06-29' AS Date), N'Hernández')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (93, 6, N'Andrea', N'Pérez', N'7.36834e+007', N'andrea.pérez@correo.com', NULL, NULL, CAST(N'2020-11-04' AS Date), CAST(N'2024-04-29' AS Date), N'Morales')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (94, 7, N'Fernando', N'Sánchez', N'9.79866e+007', N'fernando.sánchez@correo.com', NULL, NULL, CAST(N'2024-09-25' AS Date), CAST(N'2024-05-16' AS Date), N'Castillo')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (95, 8, N'Sofía', N'Ramírez', N'6.68821e+007', N'sofía.ramírez@correo.com', NULL, NULL, CAST(N'2023-03-18' AS Date), CAST(N'2024-04-09' AS Date), N'Mendoza')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (96, 9, N'Alejandro', N'Torres', N'1.61416e+007', N'alejandro.torres@correo.com', NULL, NULL, CAST(N'2022-09-30' AS Date), CAST(N'2023-09-15' AS Date), N'Ortega')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (97, 10, N'Valeria', N'Flores', N'5.94715e+007', N'valeria.flores@correo.com', NULL, NULL, CAST(N'2024-05-18' AS Date), CAST(N'2025-01-11' AS Date), N'Cruz')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (98, 11, N'Ricardo', N'Gómez', N'2.94593e+007', N'ricardo.gómez@correo.com', NULL, NULL, CAST(N'2024-01-14' AS Date), CAST(N'2024-04-12' AS Date), N'Jiménez')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (99, 12, N'Lucía', N'Díaz', N'4.54823e+007', N'lucía.díaz@correo.com', NULL, NULL, CAST(N'2022-12-06' AS Date), CAST(N'2024-07-28' AS Date), N'Reyes')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (100, 13, N'Carlos', N'García', N'3.557e+007', N'carlos.garcía@correo.com', NULL, NULL, CAST(N'2023-11-19' AS Date), CAST(N'2024-02-02' AS Date), N'Rojas')
GO
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (101, 14, N'María', N'López', N'2.04928e+007', N'maría.lópez@correo.com', NULL, NULL, CAST(N'2021-09-30' AS Date), CAST(N'2024-12-28' AS Date), N'Vargas')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (102, 15, N'Javier', N'Martínez', N'2.9264e+007', N'javier.martínez@correo.com', NULL, NULL, CAST(N'2023-04-09' AS Date), CAST(N'2023-07-29' AS Date), N'Hernández')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (103, 16, N'Andrea', N'Pérez', N'9.7195e+007', N'andrea.pérez@correo.com', NULL, NULL, CAST(N'2022-10-14' AS Date), CAST(N'2023-12-19' AS Date), N'Morales')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (104, 17, N'Fernando', N'Sánchez', N'1.72525e+007', N'fernando.sánchez@correo.com', NULL, NULL, CAST(N'2024-12-16' AS Date), CAST(N'2022-05-07' AS Date), N'Castillo')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (105, 18, N'Sofía', N'Ramírez', N'9.83078e+007', N'sofía.ramírez@correo.com', NULL, NULL, CAST(N'2023-04-22' AS Date), CAST(N'2025-01-06' AS Date), N'Mendoza')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (106, 19, N'Alejandro', N'Torres', N'6.05612e+007', N'alejandro.torres@correo.com', NULL, NULL, CAST(N'2023-05-25' AS Date), CAST(N'2024-08-14' AS Date), N'Ortega')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (108, 21, N'Ricardo', N'Gómez', N'6.14621e+007', N'ricardo.gómez@correo.com', NULL, NULL, CAST(N'2023-12-23' AS Date), CAST(N'2023-12-10' AS Date), N'Jiménez')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (109, 22, N'Lucía', N'Díaz', N'4.55285e+007', N'lucía.díaz@correo.com', NULL, NULL, CAST(N'2022-05-31' AS Date), CAST(N'2022-06-25' AS Date), N'Reyes')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (110, 3, N'Carlos', N'García', N'7.11212e+007', N'carlos.garcía@correo.com', NULL, NULL, CAST(N'2022-11-29' AS Date), CAST(N'2022-08-02' AS Date), N'Rojas')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (111, 4, N'María', N'López', N'5.37113e+007', N'maría.lópez@correo.com', NULL, NULL, CAST(N'2024-06-04' AS Date), CAST(N'2023-03-26' AS Date), N'Vargas')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (112, 5, N'Javier', N'Martínez', N'6.424e+007', N'javier.martínez@correo.com', NULL, NULL, CAST(N'2023-04-14' AS Date), CAST(N'2022-04-19' AS Date), N'Hernández')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (113, 6, N'Andrea', N'Pérez', N'3.98399e+007', N'andrea.pérez@correo.com', NULL, NULL, CAST(N'2024-04-17' AS Date), CAST(N'2023-08-05' AS Date), N'Morales')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (114, 7, N'Fernando', N'Sánchez', N'2.98613e+007', N'fernando.sánchez@correo.com', NULL, NULL, CAST(N'2020-04-08' AS Date), CAST(N'2023-10-06' AS Date), N'Castillo')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (115, 8, N'Sofía', N'Ramírez', N'9.53855e+007', N'sofía.ramírez@correo.com', NULL, NULL, CAST(N'2023-12-30' AS Date), CAST(N'2023-04-17' AS Date), N'Mendoza')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (116, 9, N'Alejandro', N'Torres', N'4.4083e+007', N'alejandro.torres@correo.com', NULL, NULL, CAST(N'2021-12-13' AS Date), CAST(N'2024-10-12' AS Date), N'Ortega')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (117, 10, N'Valeria', N'Flores', N'5.55941e+007', N'valeria.flores@correo.com', NULL, NULL, CAST(N'2020-12-23' AS Date), CAST(N'2023-05-22' AS Date), N'Cruz')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (118, 11, N'Ricardo', N'Gómez', N'1.39748e+007', N'ricardo.gómez@correo.com', NULL, NULL, CAST(N'2022-01-17' AS Date), CAST(N'2024-09-23' AS Date), N'Jiménez')
INSERT [dbo].[empleados] ([id], [profesion_id], [nombres], [apellido_paterno], [numero_documento], [email_personal], [email_institucional], [celular], [fecha_ingreso], [fecha_fin_contrato], [apellido_materno]) VALUES (119, 12, N'Lucía', N'Díaz', N'4.57954e+007', N'lucía.díaz@correo.com', NULL, NULL, CAST(N'2020-10-03' AS Date), CAST(N'2023-11-27' AS Date), N'Reyes')
SET IDENTITY_INSERT [dbo].[empleados] OFF
GO
SET IDENTITY_INSERT [dbo].[equipos] ON 

INSERT [dbo].[equipos] ([id], [proyecto_id], [nombre], [fecha_creacion], [fecha_fin], [num_integrantes], [presupuesto_asignado], [funciones]) VALUES (2, 12, N'Equipo Desarrollo Backend', CAST(N'2024-01-15T00:00:00.000' AS DateTime), CAST(N'2024-06-30T00:00:00.000' AS DateTime), 7, 20000.0000, N'Desarrollo y mantenimiento del backend.')
INSERT [dbo].[equipos] ([id], [proyecto_id], [nombre], [fecha_creacion], [fecha_fin], [num_integrantes], [presupuesto_asignado], [funciones]) VALUES (3, 12, N'Equipo Desarrollo Frontend', CAST(N'2024-01-20T00:00:00.000' AS DateTime), CAST(N'2024-06-30T00:00:00.000' AS DateTime), 8, 15000.0000, N'Diseño y desarrollo del frontend.')
INSERT [dbo].[equipos] ([id], [proyecto_id], [nombre], [fecha_creacion], [fecha_fin], [num_integrantes], [presupuesto_asignado], [funciones]) VALUES (4, 12, N'Equipo QA y Testing', CAST(N'2024-02-01T00:00:00.000' AS DateTime), CAST(N'2024-06-30T00:00:00.000' AS DateTime), 6, 10000.0000, N'Pruebas de calidad y aseguramiento.')
INSERT [dbo].[equipos] ([id], [proyecto_id], [nombre], [fecha_creacion], [fecha_fin], [num_integrantes], [presupuesto_asignado], [funciones]) VALUES (5, 11, N'Equipo Implementación ERP', CAST(N'2024-02-05T00:00:00.000' AS DateTime), CAST(N'2024-08-15T00:00:00.000' AS DateTime), 7, 30000.0000, N'Configuración y personalización del ERP.')
INSERT [dbo].[equipos] ([id], [proyecto_id], [nombre], [fecha_creacion], [fecha_fin], [num_integrantes], [presupuesto_asignado], [funciones]) VALUES (6, 11, N'Equipo Capacitación', CAST(N'2024-02-15T00:00:00.000' AS DateTime), CAST(N'2024-08-15T00:00:00.000' AS DateTime), 8, 12000.0000, N'Capacitación a usuarios finales.')
INSERT [dbo].[equipos] ([id], [proyecto_id], [nombre], [fecha_creacion], [fecha_fin], [num_integrantes], [presupuesto_asignado], [funciones]) VALUES (7, 3, N'Equipo Desarrollo App', CAST(N'2024-03-10T00:00:00.000' AS DateTime), CAST(N'2024-09-30T00:00:00.000' AS DateTime), 9, 25000.0000, N'Desarrollo de la app móvil.')
INSERT [dbo].[equipos] ([id], [proyecto_id], [nombre], [fecha_creacion], [fecha_fin], [num_integrantes], [presupuesto_asignado], [funciones]) VALUES (8, 3, N'Equipo UI/UX', CAST(N'2024-03-15T00:00:00.000' AS DateTime), CAST(N'2024-09-30T00:00:00.000' AS DateTime), 7, 12000.0000, N'Diseño de experiencia de usuario.')
INSERT [dbo].[equipos] ([id], [proyecto_id], [nombre], [fecha_creacion], [fecha_fin], [num_integrantes], [presupuesto_asignado], [funciones]) VALUES (9, 4, N'Equipo Automatización', CAST(N'2024-04-10T00:00:00.000' AS DateTime), CAST(N'2024-12-20T00:00:00.000' AS DateTime), 5, 20000.0000, N'Desarrollo de scripts de automatización.')
INSERT [dbo].[equipos] ([id], [proyecto_id], [nombre], [fecha_creacion], [fecha_fin], [num_integrantes], [presupuesto_asignado], [funciones]) VALUES (10, 4, N'Equipo Integraciones', CAST(N'2024-04-20T00:00:00.000' AS DateTime), CAST(N'2024-12-20T00:00:00.000' AS DateTime), 6, 18000.0000, N'Integración de sistemas existentes.')
INSERT [dbo].[equipos] ([id], [proyecto_id], [nombre], [fecha_creacion], [fecha_fin], [num_integrantes], [presupuesto_asignado], [funciones]) VALUES (11, 5, N'Equipo Migración Cloud', CAST(N'2024-05-20T00:00:00.000' AS DateTime), CAST(N'2024-11-15T00:00:00.000' AS DateTime), 6, 40000.0000, N'Migración de infraestructura a la nube.')
INSERT [dbo].[equipos] ([id], [proyecto_id], [nombre], [fecha_creacion], [fecha_fin], [num_integrantes], [presupuesto_asignado], [funciones]) VALUES (12, 5, N'Equipo Seguridad Cloud', CAST(N'2024-06-01T00:00:00.000' AS DateTime), CAST(N'2024-11-15T00:00:00.000' AS DateTime), 9, 25000.0000, N'Implementación de seguridad en la nube.')
INSERT [dbo].[equipos] ([id], [proyecto_id], [nombre], [fecha_creacion], [fecha_fin], [num_integrantes], [presupuesto_asignado], [funciones]) VALUES (13, 6, N'Equipo BI y Big Data', CAST(N'2024-06-15T00:00:00.000' AS DateTime), CAST(N'2024-12-31T00:00:00.000' AS DateTime), 8, 50000.0000, N'Implementación de soluciones de BI.')
INSERT [dbo].[equipos] ([id], [proyecto_id], [nombre], [fecha_creacion], [fecha_fin], [num_integrantes], [presupuesto_asignado], [funciones]) VALUES (14, 6, N'Equipo Análisis Predictivo', CAST(N'2024-07-01T00:00:00.000' AS DateTime), CAST(N'2024-12-31T00:00:00.000' AS DateTime), 7, 30000.0000, N'Desarrollo de modelos de predicción.')
INSERT [dbo].[equipos] ([id], [proyecto_id], [nombre], [fecha_creacion], [fecha_fin], [num_integrantes], [presupuesto_asignado], [funciones]) VALUES (15, 7, N'Equipo Seguridad TI', CAST(N'2024-07-25T00:00:00.000' AS DateTime), CAST(N'2025-01-20T00:00:00.000' AS DateTime), 7, 40000.0000, N'Auditoría y fortalecimiento de seguridad.')
INSERT [dbo].[equipos] ([id], [proyecto_id], [nombre], [fecha_creacion], [fecha_fin], [num_integrantes], [presupuesto_asignado], [funciones]) VALUES (16, 7, N'Equipo Gestión de Riesgos', CAST(N'2024-08-10T00:00:00.000' AS DateTime), CAST(N'2025-01-20T00:00:00.000' AS DateTime), 6, 25000.0000, N'Análisis y mitigación de riesgos.')
INSERT [dbo].[equipos] ([id], [proyecto_id], [nombre], [fecha_creacion], [fecha_fin], [num_integrantes], [presupuesto_asignado], [funciones]) VALUES (17, 8, N'Equipo Logística y Transporte', CAST(N'2024-08-15T00:00:00.000' AS DateTime), CAST(N'2025-02-28T00:00:00.000' AS DateTime), 5, 35000.0000, N'Optimización de la cadena de suministros.')
INSERT [dbo].[equipos] ([id], [proyecto_id], [nombre], [fecha_creacion], [fecha_fin], [num_integrantes], [presupuesto_asignado], [funciones]) VALUES (18, 8, N'Equipo Almacenes', CAST(N'2024-08-25T00:00:00.000' AS DateTime), CAST(N'2025-02-28T00:00:00.000' AS DateTime), 6, 20000.0000, N'Mejoras en la gestión de almacenes.')
INSERT [dbo].[equipos] ([id], [proyecto_id], [nombre], [fecha_creacion], [fecha_fin], [num_integrantes], [presupuesto_asignado], [funciones]) VALUES (19, 9, N'Equipo Desarrollo CRM', CAST(N'2024-09-15T00:00:00.000' AS DateTime), CAST(N'2025-03-15T00:00:00.000' AS DateTime), 4, 40000.0000, N'Desarrollo del sistema CRM.')
INSERT [dbo].[equipos] ([id], [proyecto_id], [nombre], [fecha_creacion], [fecha_fin], [num_integrantes], [presupuesto_asignado], [funciones]) VALUES (20, 9, N'Equipo Integraciones CRM', CAST(N'2024-09-25T00:00:00.000' AS DateTime), CAST(N'2025-03-15T00:00:00.000' AS DateTime), 5, 25000.0000, N'Conexión con sistemas externos.')
INSERT [dbo].[equipos] ([id], [proyecto_id], [nombre], [fecha_creacion], [fecha_fin], [num_integrantes], [presupuesto_asignado], [funciones]) VALUES (21, 10, N'Equipo Estrategia de Expansión', CAST(N'2024-10-10T00:00:00.000' AS DateTime), CAST(N'2025-06-30T00:00:00.000' AS DateTime), 8, 50000.0000, N'Análisis de mercado y expansión.')
INSERT [dbo].[equipos] ([id], [proyecto_id], [nombre], [fecha_creacion], [fecha_fin], [num_integrantes], [presupuesto_asignado], [funciones]) VALUES (22, 10, N'Equipo Legal y Normativa', CAST(N'2024-10-20T00:00:00.000' AS DateTime), CAST(N'2025-06-30T00:00:00.000' AS DateTime), 8, 30000.0000, N'Cumplimiento legal en nuevos mercados.')
SET IDENTITY_INSERT [dbo].[equipos] OFF
GO
SET IDENTITY_INSERT [dbo].[profesiones] ON 

INSERT [dbo].[profesiones] ([id], [nombre]) VALUES (21, N'Abogado Corporativo')
INSERT [dbo].[profesiones] ([id], [nombre]) VALUES (5, N'Administrador de Empresas')
INSERT [dbo].[profesiones] ([id], [nombre]) VALUES (4, N'Analista de Datos')
INSERT [dbo].[profesiones] ([id], [nombre]) VALUES (13, N'Analista de Negocios')
INSERT [dbo].[profesiones] ([id], [nombre]) VALUES (9, N'Arquitecto')
INSERT [dbo].[profesiones] ([id], [nombre]) VALUES (17, N'Auditor Financiero')
INSERT [dbo].[profesiones] ([id], [nombre]) VALUES (19, N'Científico de Datos')
INSERT [dbo].[profesiones] ([id], [nombre]) VALUES (10, N'Consultor Financiero')
INSERT [dbo].[profesiones] ([id], [nombre]) VALUES (6, N'Contador Público')
INSERT [dbo].[profesiones] ([id], [nombre]) VALUES (12, N'Desarrollador Web')
INSERT [dbo].[profesiones] ([id], [nombre]) VALUES (16, N'Diseñador UX/UI')
INSERT [dbo].[profesiones] ([id], [nombre]) VALUES (7, N'Economista')
INSERT [dbo].[profesiones] ([id], [nombre]) VALUES (11, N'Especialista en Marketing Digital')
INSERT [dbo].[profesiones] ([id], [nombre]) VALUES (22, N'Especialista en Recursos Humanos')
INSERT [dbo].[profesiones] ([id], [nombre]) VALUES (8, N'Ingeniero Civil')
INSERT [dbo].[profesiones] ([id], [nombre]) VALUES (3, N'Ingeniero de Software')
INSERT [dbo].[profesiones] ([id], [nombre]) VALUES (18, N'Ingeniero Electrónico')
INSERT [dbo].[profesiones] ([id], [nombre]) VALUES (14, N'Ingeniero Industrial')
INSERT [dbo].[profesiones] ([id], [nombre]) VALUES (15, N'Jefe de Proyectos TI')
SET IDENTITY_INSERT [dbo].[profesiones] OFF
GO
SET IDENTITY_INSERT [dbo].[proyectos] ON 

INSERT [dbo].[proyectos] ([id], [cliente_id], [codigo], [nombre], [descripcion], [fecha_inicio], [fecha_fin], [estado], [presupuesto_asignado]) VALUES (3, 1, N'PROJ001', N'Sistema de Gestión Financiera', N'Desarrollo de un sistema para control financiero.', CAST(N'2024-01-10' AS Date), CAST(N'2024-06-30' AS Date), N'En curso', 50000.0000)
INSERT [dbo].[proyectos] ([id], [cliente_id], [codigo], [nombre], [descripcion], [fecha_inicio], [fecha_fin], [estado], [presupuesto_asignado]) VALUES (4, 122, N'PROJ002', N'Implementación de ERP', N'Instalación y configuración de un ERP para la empresa.', CAST(N'2024-02-01' AS Date), CAST(N'2024-08-15' AS Date), N'Planificado', 75000.0000)
INSERT [dbo].[proyectos] ([id], [cliente_id], [codigo], [nombre], [descripcion], [fecha_inicio], [fecha_fin], [estado], [presupuesto_asignado]) VALUES (5, 130, N'PROJ003', N'Desarrollo de App Móvil', N'Creación de una aplicación móvil para clientes.', CAST(N'2024-03-05' AS Date), CAST(N'2024-09-30' AS Date), N'En curso', 60000.0000)
INSERT [dbo].[proyectos] ([id], [cliente_id], [codigo], [nombre], [descripcion], [fecha_inicio], [fecha_fin], [estado], [presupuesto_asignado]) VALUES (6, 134, N'PROJ004', N'Automatización de Procesos', N'Optimización de flujos de trabajo internos.', CAST(N'2024-04-01' AS Date), CAST(N'2024-12-20' AS Date), N'Planificado', 45000.0000)
INSERT [dbo].[proyectos] ([id], [cliente_id], [codigo], [nombre], [descripcion], [fecha_inicio], [fecha_fin], [estado], [presupuesto_asignado]) VALUES (7, 125, N'PROJ005', N'Migración a la Nube', N'Migración de servidores a una infraestructura cloud.', CAST(N'2024-05-15' AS Date), CAST(N'2024-11-15' AS Date), N'En curso', 90000.0000)
INSERT [dbo].[proyectos] ([id], [cliente_id], [codigo], [nombre], [descripcion], [fecha_inicio], [fecha_fin], [estado], [presupuesto_asignado]) VALUES (8, 136, N'PROJ006', N'Análisis de Datos Avanzado', N'Implementación de herramientas de BI y Big Data.', CAST(N'2024-06-10' AS Date), CAST(N'2024-12-31' AS Date), N'Pendiente', 85000.0000)
INSERT [dbo].[proyectos] ([id], [cliente_id], [codigo], [nombre], [descripcion], [fecha_inicio], [fecha_fin], [estado], [presupuesto_asignado]) VALUES (9, 127, N'PROJ007', N'Ciberseguridad Empresarial', N'Fortalecimiento de seguridad informática.', CAST(N'2024-07-20' AS Date), CAST(N'2025-01-20' AS Date), N'Planificado', 72000.0000)
INSERT [dbo].[proyectos] ([id], [cliente_id], [codigo], [nombre], [descripcion], [fecha_inicio], [fecha_fin], [estado], [presupuesto_asignado]) VALUES (10, 138, N'PROJ008', N'Optimización de Logística', N'Mejora de procesos de distribución y almacenamiento.', CAST(N'2024-08-05' AS Date), CAST(N'2025-02-28' AS Date), N'En curso', 55000.0000)
INSERT [dbo].[proyectos] ([id], [cliente_id], [codigo], [nombre], [descripcion], [fecha_inicio], [fecha_fin], [estado], [presupuesto_asignado]) VALUES (11, 129, N'PROJ009', N'Desarrollo de CRM', N'Implementación de un sistema CRM personalizado.', CAST(N'2024-09-10' AS Date), CAST(N'2025-03-15' AS Date), N'Pendiente', 68000.0000)
INSERT [dbo].[proyectos] ([id], [cliente_id], [codigo], [nombre], [descripcion], [fecha_inicio], [fecha_fin], [estado], [presupuesto_asignado]) VALUES (12, 140, N'PROJ010', N'Expansión Internacional', N'Análisis y estrategia para expandir operaciones.', CAST(N'2024-10-01' AS Date), CAST(N'2025-06-30' AS Date), N'Planificado', 120000.0000)
SET IDENTITY_INSERT [dbo].[proyectos] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [identificador_cliente_CONSTRAINT]    Script Date: 10/03/2025 21:25:34 ******/
ALTER TABLE [dbo].[clientes] ADD  CONSTRAINT [identificador_cliente_CONSTRAINT] UNIQUE NONCLUSTERED 
(
	[identificador_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__clientes__40F9A20633DE4649]    Script Date: 10/03/2025 21:25:34 ******/
ALTER TABLE [dbo].[clientes] ADD UNIQUE NONCLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__clientes__AB6E6164CEC0637C]    Script Date: 10/03/2025 21:25:34 ******/
ALTER TABLE [dbo].[clientes] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__profesio__72AFBCC692881AC4]    Script Date: 10/03/2025 21:25:34 ******/
ALTER TABLE [dbo].[profesiones] ADD UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
/****** Object:  StoredProcedure [dbo].[sp_kv_generar_cuotas]    Script Date: 10/03/2025 21:25:34 ******/
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
