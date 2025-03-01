
--Creación de la base de datos
CREATE DATABASE bd_gestion_proyectos;
GO

-- Selección de la base de datos creada
USE bd_gestion_proyectos;

-- Creación de tablas

--- Tabla clientes
CREATE TABLE clientes (
id INT IDENTITY(1,1) PRIMARY KEY,
codigo VARCHAR(10) NOT NULL UNIQUE,
nombre VARCHAR(100) NOT NULL,
sector VARCHAR(75),
pais VARCHAR(100),
email VARCHAR(55) UNIQUE,
telefono VARCHAR(25),
identificador_cliente VARCHAR(30),
direccion VARCHAR(255),
web_url VARCHAR (100),
tipo VARCHAR(100)
);
Go
--- Tabla puestos/cargos
CREATE TABLE profesiones (
id INT IDENTITY(1,1) PRIMARY KEY,
nombre VARCHAR(155) UNIQUE NOT NULL);

--DROP TABLE profesiones;
--- Tabla Empleados
CREATE TABLE empleados (
id INT IDENTITY(1,1) PRIMARY KEY,
profesion_id INT,
nombres VARCHAR(155) NOT NULL,
apellido_paterno VARCHAR(155) NOT NULL,
Apellido_materno VARCHAR(155),
numero_documento VARCHAR(20) NOT NULL,
email_personal VARCHAR(155) NOT NULL,
email_institucional VARCHAR(155),
celular VARCHAR(20),
fecha_ingreso DATE NOT NULL,
tiempo_contrato INT,
CONSTRAINT fk_profesion_id FOREIGN KEY (profesion_id) REFERENCES profesiones(id));

--DROP TABLE empleados;

---Tabla proyectos

CREATE TABLE proyectos(
id INT IDENTITY(1,1) PRIMARY KEY,
cliente_id INT NOT NULL,
codigo VARCHAR(20) NOT NULL,
nombre VARCHAR(255) NOT NULL,
descripcion VARCHAR(MAX),
fecha_inicio DATE,
fecha_fin DATE,
estado VARCHAR(55) NOT NULL,
presupuesto_asignado MONEY,
CONSTRAINT fk_proyectos_cliente_id FOREIGN KEY (cliente_id) REFERENCES clientes(id));;

--- Tabla Equipos

CREATE TABLE equipos(
id INT IDENTITY(1,1) PRIMARY KEY,
proyecto_id INT NOT NULL,
nombre VARCHAR(100) NOT NULL,
fecha_creacion DATETIME NOT NULL,
fecha_fin DATETIME,
num_integrantes INT,
presupuesto_asignado MONEY,
funciones VARCHAR(MAX),
FOREIGN KEY (proyecto_id) REFERENCES proyectos(id)
);

--- TABLA detalle_equipos

CREATE TABLE detalles_equipos (
id INT IDENTITY(1,1) PRIMARY KEY,
equipo_id INT NOT NULL,
empleado_id INT NOT NULL,
horas_asignadas DECIMAL(9,2) NOT NULL,
rol VARCHAR(100) NOT NULL,
fecha_asignacion DATETIME NOT NULL,
fecha_termino_asignacion DATETIME,
FOREIGN KEY (equipo_id) REFERENCES equipos(id),
FOREIGN KEY (empleado_id) REFERENCES empleados(id));

--- TABLA cuotas

CREATE TABLE cuotas(
id INT IDENTITY(1,1)PRIMARY KEY,
proyecto_id INT NOT NULL,
numero_cuota INT NOT NULL,
monto_cuota MONEY NOT NULL,
fecha_pago DATETIME NOT NULL,
fecha_vencimiento DATETIME NOT NULL,
estado VARCHAR (100),
penalidad DECIMAL(9,2),
FOREIGN KEY (proyecto_id) REFERENCES proyectos(id)	
);

--- TABLA pagos

CREATE TABLE pagos(
id INT IDENTITY(1,1) PRIMARY KEY,
cuota_id INT NOT NULL,
numero_operacion VARCHAR(25) NOT NULL,
fecha_pago DATETIME DEFAULT (GETDATE()) NOT NULL,
concepto_pago VARCHAR (100),
monto_pagado MONEY NOT NULL,
entidad_bancaria VARCHAR (100),
FOREIGN KEY (cuota_id) REFERENCES cuotas(id));
