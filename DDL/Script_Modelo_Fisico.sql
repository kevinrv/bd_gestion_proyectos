
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


--- Tabla Empleados


